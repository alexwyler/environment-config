;
; "She may not look like much, but she's got it where it counts."
;

(add-to-list 'load-path "~/.emacs.d/")

; Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

; JS2 Mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; Show line numbers
(condition-case nil
    (global-linum-mode t)
  (error
   (message "global-linum-mode not supported")))

; No menus
(setq menu-bar-mode nil)

; Show column numbers in status buffer
(setq column-number-mode t)

; 2-space indentation
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(setq js-indent-level 2)
(setq c-basic-offset 2)

; No large file warning
(setq large-file-warning-threshold nil)

; Save place in buffer
(require 'saveplace)
(setq-default save-place t)

; Turn off vc-git -- load time is TOO DAMN HIGH
(require 'vc)
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(setq vc-handled-backends nil)

; Force meta to option key on mac
(condition-case nil
		(setq mac-option-modifier 'meta)
	(error "Seting mac-option-modifier failed"))

; Ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(condition-case nil
    (ido-mode 1)
  (error
   (message "Failed to set start ido-mode")))

; unique buffer names using path
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

; Mouse clicks
(global-set-key
 [mouse-1]
 '(lambda (event)
    (interactive "e")
    (mouse-set-point event)))

; Turn off bell
(setq ring-bell-function 'ignore)

; Rebind 'join-line -- M-^ is a stretch
(global-set-key (kbd "C-x j") 'join-line)

; Make cheating with arrow keys easier
(global-set-key (kbd "C-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<down>") 'forward-paragraph)

; As much as I love the splash screen...
(setq inhibit-splash-screen t)

; No scroll bars
(setq scroll-bar-mode nil)

; Auto revert-buffer
(global-auto-revert-mode t)
(setq auto-revert-verbose nil)

; show trailing whitespace ...
(set-face-background 'trailing-whitespace "#900000")
(setq-default show-trailing-whitespace t)
; ... and terminate with extreme prejudice
(defun delete-trailing-whitespace-sometimes () ""
  (if (not (eq major-mode 'diff-mode))
      (delete-trailing-whitespace)))
(add-hook 'write-file-hooks 'delete-trailing-whitespace-sometimes)

; copy-paste over X
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

; Color scheme
(custom-set-faces
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "#C776D0"))))
 '(font-lock-comment-face ((t (:foreground "#808080"))))
 '(font-lock-constant-face ((((class color) (background dark)) (:bold t :foreground "#2FC3FE"))))
 '(font-lock-doc-string-face ((t (:foreground "#dd8ddc"))))
 '(font-lock-function-name-face ((t (:foreground "#F5F24E"))))
 '(font-lock-keyword-face ((t (:bold t :foreground "#2FC3FE"))))
 '(font-lock-preprocessor-face ((t (:italic nil :foreground "#A0A0A0"))))
 '(font-lock-reference-face ((t (:foreground "#FAFA5A"))))
 '(font-lock-string-face ((t (:foreground "#99ff61"))))
 '(font-lock-type-face ((t (:foreground "#F5F24E"))))
 '(font-lock-variable-name-face ((t (:foreground "#F57A7A"))))
 '(font-lock-warning-face ((t (:bold t :foreground "#F57A7A"))))
 '(compilation-info ((t (:foreground  "#2FC3FE"))))
 '(minibuffer-prompt ((((background dark)) (:foreground "#2FC3FE")))))
(set-foreground-color "#F1F1F1")
(set-background-color "#1E1E1E")
(set-face-foreground 'minibuffer-prompt "#F5F24E")

; Font
(set-face-attribute 'default nil :family "consolas" :height 130)

; pretty colors in eshell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

; Highlight matching parens
(show-paren-mode t)

; Hilight current line
(load-library "hl-line.el")
(global-hl-line-mode 1)
(set-face-background 'hl-line "#101010")

; Start emacs server
(server-start)
