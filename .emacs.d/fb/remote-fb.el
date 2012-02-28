;
; FB-specific config for dev over sshfs
;
; expected vars:
; sshfs-repo-path           -- repo path over sshfs
; remote-repo-path          -- repo path on dev server
; master-dir                -- shared scripts path over sshfs (name expected by master.emacs)
; remote-cmf-path           -- cmf binary location on dev server
;

(add-to-list 'load-path "~/.emacs.d/fb/")

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
  (string-replace sshfs-repo-path remote-repo-path path))

(defun remote-default-directory ()
  "Get remote-ized default-directory"
  (remote-ize default-directory))

; visit www tags
(condition-case nil
    (visit-tags-table (concat sshfs-repo-path "TAGS"))
  (error "Unable to visit remote www TAGS table"))

; load master.emacs
(load-library (concat master-dir "/master.emacs"))

; override with custom tbgx module
(load-library "~/.emacs.d/fb/tbgX.el")

; Run cmf from within emacs
(defun fix-init ()
  "Run cmf on current module"
  (interactive)
  (shell-command
   (concat
		"ssh dev 'cd "
		remote-repo-path
		"&& yes | "
		remote-cmf-path
		" --fix "
		(remote-default-directory)
		"'")))
(global-set-key (kbd "C-S-i") 'fix-init)

; TODO: cleanup devtools stuff
; (load-library "~/.emacs.d/fb/devtools.el")

