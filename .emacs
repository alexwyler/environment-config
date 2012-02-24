(add-to-list 'load-path "~/.emacs.d/")
(load-library "util.el")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;(load "~/.emacs.d/remote-fb.el")
(condition-case nil
    (global-linum-mode)
  (error nil))

(setq large-file-warning-threshold nil)
(setq default-tab-width 2)
(setq column-number-mode t)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

(condition-case nil
    (if (window-system) (normal-erase-is-backspace-mode 1))
  (error nil))
(load-library "ido.el")
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(condition-case nil
    (ido-mode 1)
  (error nil))

(global-set-key (kbd "M-TAB") 'dabbrev-expand)

(global-set-key [mouse-1] '(lambda (event)
(interactive "e")
(mouse-set-point event)))

(global-hl-line-mode 1)
(set-face-background 'hl-line "#202020")

(setq ring-bell-function 'ignore)
(global-unset-key (kbd "M-<up>"))
(global-unset-key (kbd "M-<down>"))
(global-set-key (kbd "C-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<down>") 'forward-paragraph)
(global-set-key (kbd "C-x j") 'join-line)


;(global-set-key [(tab)] 'smart-tab)
(global-set-key (kbd "C-<tab>") 'smart-tab)
(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))

(setq inhibit-splash-screen t)

;; Color scheme
(custom-set-faces
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "#99ff61"))))
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
(set-face-attribute 'default nil :family "consolas" :height 130)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    (if (> (x-display-pixel-width) 1280)
        (set-frame-size (selected-frame) 180 112)
      (set-frame-size (selected-frame) 80 40))
    ))
)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(global-linum-mode t)
 '(global-auto-revert-mode t))

(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(defun ask-user-about-supersession-threat (fn)
  "blatantly ignore files that changed on disk"
  )
(defun ask-user-about-lock (file opponent)
  "always grab lock"
  t)

(server-start)

(set-foreground-color "#F0F0F1")
(set-background-color "#202020")
(set-face-foreground 'minibuffer-prompt "#F5F24E")
(add-hook 'after-make-frame-functions
'(lambda (f) (with-selected-frame f
               (progn
                 (set-foreground-color "#F0F0F1")
                 (set-background-color "#303030")
                 (set-frame-size-according-to-resolution)
                 )
   )
))

;; allow new cut-paste support
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

