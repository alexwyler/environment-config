(setq mac-pass-option-to-system t)

(condition-case nil
		(setq mac-option-modifier 'meta)
	(error nil))

(defvar base "/Volumes/sshfs/dev/")
(setq base "/Volumes/sshfs/dev/")

; TODO: rsync this chron-style
(condition-case nil
    (visit-tags-table (concat base "www/TAGS"))
  (error nil))

(condition-case nil
    (visit-tags-table (concat base "devtools/TAGS"))
  (error nil))

(defvar master-dir "~/engshare")

(load-library (concat master-dir "/master.emacs"))

(setq magic-mode-alist (append '(("<\\?php\\s " . xhp-mode))
                              magic-mode-alist))
(setq auto-mode-alist (append '(("\\.php$" . xhp-mode))
                              auto-mode-alist))

(load-library "~/.emacs.d/util.el")
(defvar curdevdir (string-replace "/Users/awyler/" "~/" default-directory))
(defvar curdevdir (string-replace "/Volumes/sshfs/dev/www/" "~/www/" default-directory))

(defun fix-init ()
  "Fix __init__.php files for a flib module."
  (interactive)
  (shell-command
   (concat
    (concat "ssh dev 'cd "
            (string-replace "/Volumes/sshfs/dev/www/" "~/www/" default-directory))
    " && yes | ~/www/flib/_bin/checkModuleFast --fix'")
   )
  )
(global-set-key (kbd "C-S-i") 'fix-init)

(defun phlint-module ()
  "Lint phutil module."
  (interactive)
  (shell-command
   (concat
    (concat "cd ~/devtools/phabricator; echo Y | arc lint " default-directory)
    "")))

(defun phbuild-modules ()
  "Build phutilmodules"
  (interactive)
  (shell-command "~/devtools/arcanist/scripts/phutil_mapper.php ~/devtools/phabricator/src/ &"))

(defun rebuild-celerity ()
  "Rebuild celerity"
  (interactive)
  (shell-command "~/devtools/phabricator/scripts/celerity_mapper.php ~/devtools/phabricator/webroot &"))

(global-set-key (kbd "C-S-l") 'phbuild-modules)
(global-set-key (kbd "C-S-c") 'rebuild-celerity)

(eval default-directory)
(setq auto-mode-alist
      (cons '("\\.php$" . xhp-mode) auto-mode-alist))

;; todo
;; (add-hook 'php-mode-hook '(lambda () (flymake-mode 1)))
;; (global-set-key [f13] 'flymake-mode)

(require 'vc)
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
(setq vc-handled-backends nil)
