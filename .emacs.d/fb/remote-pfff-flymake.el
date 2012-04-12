;;; pfff-flymake.el --- on-the-fly syntax checker
;;; Copyright (C) 2011 Facebook Inc.
;;; Author: Aaron Brady <abrady0@fb.com>
;;; https://github.com/facebook/pfff
;;; Usage:
;;   Load this library and run (pfff-flymake-mode t) to start. you
;;   can do this at startup or in your php load hook.
;;
;;; Commentary: This file implements a simple on-the-fly syntax checker leveraging
;;   the pfff_client's analysis capability. This currently only
;;   include php files, pfff can parse a variety of languages and if
;;   it is possible to get the environments set up properly, this mode
;;   could be extended to support javascript, css, etc.
;;
;;   This is a global mode, so it only has to be run once, but running
;;   it multiple times is harmless. It only ever runs one process at a
;;   time, and will only syntax check the user's current window.

;;
;; expects:
;; sshfs-mount -- local mount point for dev server
;; dev-server  -- location of dev box

(require 'overlay)
(require 'flymake)

(defvar pfff-flymake-log-level 0)
(defun pfff-flymake-log (level msg &rest args)
  (if (> pfff-flymake-log-level level)
      (apply 'message msg args))
)

(setq temporary-file-directory (concat sshfs-mount "var/tmp/"))

(remote-ize (make-temp-file "pfff_flymake_"))

; define some helper functions
(defun string-replace (this withthat in)
  "replace THIS with WITHTHAT' in the string IN"
  (with-temp-buffer
    (insert in)
    (goto-char (point-min))
    (while (search-forward this nil t)
      (replace-match withthat nil t))
    (buffer-substring (point-min) (point-max))))

(defun remote-ize (path)
  "Convert sshfs path to remote path"
  (string-replace sshfs-mount "/" path))

(defcustom pfff-flymake-syntax-checker
  "/home/engshare/tools/pfff_client"
  "the executable that will do the syntax checking")

(defvar pfff-flymake-process nil
  "the single running flymake process")

(defvar pfff-flymake-temp-file nil
  "the current temporary file for the current process")

(defvar pfff-flymake-idle-timer nil
  "the timer that fires when syntax checking is on")

(defcustom pfff-flymake-idle-timer-secs .3
  "the number of idle seconds to wait before launching the flymake process")

(defvar pfff-flymake-current-buf nil
  "the buffer being syntax checked")

(defun pfff-flymake-delete-overlays (&optional buf)
  (interactive)
  "Delete all flymake overlays in BUFFER."
  (with-current-buffer (or buf (current-buffer))
   (dolist (ol (overlays-in (point-min) (point-max)))
     (when (overlay-get ol 'pfff-flymake-overlay)
       (delete-overlay ol)
       )
     )
   )
)

(defun pfff-flymake-set-error-at-pos (point &optional error_msg buf)
  "set the overlay at the point so the error is visible"
  (with-current-buffer (or buf pfff-flymake-current-buf)
    (save-excursion
      (goto-char point)
      (let
          (
           (ol (make-overlay (line-beginning-position) (line-end-position)))
           )
        (overlay-put ol 'face 'flymake-errline)
        (overlay-put ol 'help-echo error_msg)
        (overlay-put ol 'pfff-flymake-overlay  t)
        )
      )
    )
)

(defun pfff-flymake-output-checker  (proc status)
  (if (eq (process-status proc) 'exit)
      (progn
        (pfff-flymake-delete-overlays pfff-flymake-current-buf)
        (with-current-buffer "*pfff-flymake*"
          (pfff-flymake-log 3 "pfff-flymake process completed with no errors")
          (goto-char (point-min))
          (while (re-search-forward "^File \"\\(.*?\\)\",.*charpos = \\([0-9]+\\)" nil t)
            (let*
                (
                 (charpos (string-to-number (match-string 2)))
                 (error_msg (and (forward-line 1) (buffer-substring (line-beginning-position) (line-end-position))))
                 )
              (pfff-flymake-set-error-at-pos charpos error_msg)
              )
            )
          )
        (if (file-exists-p pfff-flymake-temp-file)
            (delete-file pfff-flymake-temp-file))
        )
    )
  )

(defun pfff-flymake-syntax-check-buffer (&optional buf)
  "compile the current buffer and get syntax errors"
  (interactive)
  (let
      (
       (buf (or buf (current-buffer)))
       )
    (if (not (equal (file-name-extension (buffer-file-name buf)) "php"))
        (pfff-flymake-log 3 "buffer %s is not a php file" buf)
      (with-current-buffer buf
        (if (and pfff-flymake-process (eq (process-status pfff-flymake-process) 'run))
            (progn
              (if (called-interactively-p)
                  (pfff-flymake-log 3 "current flymake process still running. killing it"))
              (kill-process pfff-flymake-process))
          )

        (setq pfff-flymake-current-buf buf)
        (if (not pfff-flymake-temp-file)
            (setq
             pfff-flymake-temp-file
             (make-temp-file "pfff_flymake_"))
          )

        (pfff-flymake-log 3 pfff-flymake-temp-file)
        (with-current-buffer pfff-flymake-current-buf
          (write-region nil nil pfff-flymake-temp-file nil -1 nil nil)
          )
        (pfff-flymake-log 3 "syntax-checking %s in tmp buffer %s" (buffer-name pfff-flymake-current-buf) pfff-flymake-temp-file)

        (if (get-buffer "*pfff-flymake*")
            (kill-buffer "*pfff-flymake*")
          )
        (setq
         pfff-flymake-process
         (start-process
          pfff-flymake-syntax-checker
          "*pfff-flymake*"
          "run_remote.sh"
          dev-server
          pfff-flymake-syntax-checker
          "-parse"
          (remote-ize pfff-flymake-temp-file)))
        (set-process-query-on-exit-flag pfff-flymake-process nil)
        (set-process-sentinel pfff-flymake-process 'pfff-flymake-output-checker)
        )
      )
    )
  )

(defun pfff-flymake-start-auto-syntax-check ()
  (interactive)
  "run syntax checking automatically"
  (if pfff-flymake-idle-timer
      (cancel-timer pfff-flymake-idle-timer))
  (setq pfff-flymake-idle-timer (run-with-idle-timer pfff-flymake-idle-timer-secs t 'pfff-flymake-syntax-check-buffer))
  )

(defun pfff-flymake-stop-auto-syntax-check ()
  (interactive)
  "stop the currently running syntax check timer"
  (cancel-timer pfff-flymake-idle-timer)
  (setq pfff-flymake-idle-timer nil)
  )

;;;###autoload
(define-minor-mode pfff-flymake-mode
  "Minor mode to do on-the-fly syntax checking."
  :global t :group 'flymake :lighter flymake-mode-line
  (if (or arg (not pfff-flymake-idle-timer))
      (pfff-flymake-start-auto-syntax-check)
    (pfff-flymake-stop-auto-syntax-check)
    )
)