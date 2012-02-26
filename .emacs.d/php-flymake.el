(require 'flymake)

;; php flymake is problematic in that parse errors cause a non-zero exit
;; code.
(defadvice flymake-post-syntax-check (around clear-valid-exitcode (exit-status command))
  "if the exit code is 255 that means syntax error, not something wrong with process filter. so clear it"
  (ad-Orig-flymake-post-syntax-check (if (= exit-status 255) 0 exit-status) command)
)
;;(ad-deactivate 'flymake-post-syntax-check)
(ad-activate 'flymake-post-syntax-check)

(defadvice flymake-fix-file-name (around flymake-truenamify-args (fn))
  "flymake doesn't convert filenames to true name before comparison, so this advice just calls file-truename
on the arguments before passing them on"
  (ad-Orig-flymake-fix-file-name (file-truename fn)))
;;(ad-deactivate 'flymake-fix-file-name)
(ad-activate 'flymake-fix-file-name)


;; ========================================
;; flymake

(defun php-flymake-write-__init__ (dir-src fn_dest)
  "For files in flib, includes are in __init__.php, grab its contents and insert into our temp buffer"
  (if (file-exists-p "__init__.php")
      (save-window-excursion
        (find-file "__init__.php")
        (save-excursion
          (goto-char 1)
          (let*
              (
               (cur-module (if (string-match ".*/flib/\\(.*\\)/" dir-src) (match-string 1 dir-src)))
               (lines "")
               )

            ;; init ModuleStack for require_source
            (if cur-module
                (setq lines (concat lines (format "ModuleStack::push('%s');" cur-module))))

            ;; accumulate all the 'require_modules'
            (while (re-search-forward "^require_module(.*?);" nil t)
              (setq lines (concat lines "\t" (match-string 0))))

            ;; accumulate all the 'require_source' lines that exclude the src file
            (while (re-search-forward "^require_source('\\(.*?\\)');" nil t)
              (if (not (equal (match-string 1) fn-src))
                  (setq lines (concat lines "\t" (match-string 0)))
                )
              )

            (flymake-log 3 (format "temp file: adding flib includes: %s" lines))

            ;; write out the require_modules
            (write-region
             lines
             nil
             fn_dest
             t
             566)

            )
          )
        )
    )
  )

(defadvice flymake-save-buffer-in-file (around flymake-save-buffer-in-file-extra-buffer-contents (fn))
  "Flymake just runs php on a single file, but our files often run in a more complicated context.
This advice just prepends the file to be fly-maked with information the php compiler can use to judge errors more effectively

For example:
- always sets $_SERVER['PHP_ROOT'] to ~/www
- include and run flib_init unless it is already initted
- for files under /flib/, get the require_module and require_source information from __init__.php
"
  (let
      (
       (srcfile-beginning 6) ;; skips '<?php' in the source file
       (fn-src (file-name-nondirectory (buffer-file-name)))
       (dir-src (file-name-directory (buffer-file-name)))
       )
    (if (and (not (string-match "_flymake.php" (buffer-file-name))) (< srcfile-beginning (point-max)))
        ;; note: keep everything to one line so that we don't move around error lines
        (let*
            (
             (flibinit-already-called)
             (home (expand-file-name "~"))
             (header (format "<?php $_SERVER['PHP_ROOT'] = '%s/www';" home))
             (flib-init  (format " include '%s/www/flib/__flib.php'; flib_init(FLIB_CONTEXT_SCRIPT);" home))
             )
          (flymake-log 3 (format "temp file: adding header '%s'" header))
          (write-region header nil fn nil 566)

          ;; ====================
          ;; see if we should add the header and init flib

          (save-excursion
            (goto-char (point-min))
            (setq flibinit-already-called (re-search-forward "flib_init(.*);" nil t))
            )

          (if (not flibinit-already-called)
              (progn
                (write-region flib-init nil fn t 566)
                (flymake-log 3 (format "temp file: adding %s" flib-init))
                )
            )

          (php-flymake-write-__init__ dir-src fn)


          (write-region srcfile-beginning (buffer-end 1) fn t 566) ;; offset after <?php
          (flymake-log 3 "saved buffer %s in file %s" (buffer-name) fn)
          )
      )
    )
)
;;(ad-deactivate 'flymake-save-buffer-in-file)
(ad-activate 'flymake-save-buffer-in-file)



(defvar flymake-no-delete-temp-source-file nil
  "Debugging tool. if you set this to true, the _flymake.php files will stick around to be viewed")
;;(setq flymake-no-delete-temp-source-file t)
;;(setq flymake-no-delete-temp-source-file nil)

(defadvice flymake-safe-delete-file (around flymake-no-delete-temp-source-file-handler (fn))
  (if (not flymake-no-delete-temp-source-file)
      (ad-Orig-flymake-safe-delete-file fn))
  )
;;(ad-deactivate 'flymake-safe-delete-file)
(ad-activate 'flymake-safe-delete-file)


;; AB: I think this is obviated by the advice functions above.
(defun flymake-php-true-filename (fn)
  "gets the canonical path for a file, and strip _flymake from it, if it is there. used "
  (if (string-match  "_flymake.php$" fn)
      (setq fn (replace-match ".php" t t fn)))
  (file-truename fn))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.php[345]?\\'" flymake-php-init nil flymake-php-true-filename)
             )


(add-to-list 'flymake-err-line-patterns '("^.*Error parsing \\(.*.php\\): (Line: \\([0-9]+\\), Char: \\([0-9]+\\)" 1 2 3))


(add-hook 'find-file-hook 'flymake-find-file-hook)
