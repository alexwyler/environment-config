;
; FB-specific config for dev over sshfs
;
; expected vars:
; sshfs-repo-path           -- repo path over sshfs
; remote-repo-path          -- repo path on dev server
; master-dir                -- shared scripts path over sshfs (name expected by master.emacs)
; remote-cmf-path           -- cmf binary location on dev server
; dev-server                -- location of dev box
;

(add-to-list 'load-path "~/.emacs.d/fb/")

; Reconnect to sshfs from within emacs
(defun dev-over-sshfs ()
  "Connect to dev box over sshfs"
  (interactive)
  (shell-command
   (concat
    "sshfs "
    dev-server
    ":// "
		sshfs-mount
		" -o cache_timeout=300 -o cache_stat_timeout=900 "
    "-o cache_dir_timeout=900 -o cache_link_timeout=900 -o follow_symlinks"
    )))
(global-set-key (kbd "C-S-d") 'dev-over-sshfs)

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
(condition-case nil
		(load-library (concat master-dir "/master.emacs"))
	(error "unable to load master.emacs"))

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

(defun remote-shell-command (command)
  (shell-command
   (concat
    "ssh "
    dev-server
    " \""
    command
    "\"")))

;(pfff-flymake-mode nil)
; (load-library "~/.emacs.d/fb/pfff-flymake.el")
; override pfff-flymake with some customizations
;(add-hook 'php-mode-hook
;          (lambda ()
;            (c-set-style "fb-php-style")
;            (set-variable 'comment-start "//")
;            (set-variable 'comment-end "")
;            (highlight-80+-mode t)
;            ; php-mode.el disables this, but that conflicts with arc lint
;            (set (make-local-variable 'require-final-newline) t)
;            (pfff-flymake-mode t)
;            ))
;(autoload 'pfff-flymake-mode "pfff-flymake" nil t nil)
; TODO: cleanup devtools stuff
; (load-library "~/.emacs.d/fb/devtools.el")

