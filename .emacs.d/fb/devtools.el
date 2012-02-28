;
; FB devtools config
;
; TODO: update this to work with sshfs
;

(condition-case nil
    (visit-tags-table (concat base "devtools/TAGS"))
  (error nil))

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
(global-set-key (kbd "C-S-l") 'phbuild-modules)

(defun rebuild-celerity ()
  "Rebuild celerity"
  (interactive)
  (shell-command "~/devtools/phabricator/scripts/celerity_mapper.php ~/devtools/phabricator/webroot &"))
 (global-set-key (kbd "C-S-c") 'rebuild-celerity)
