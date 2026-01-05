(setq vc-follow-symlinks t)
(setq frame-resize-pixelwise t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode '(5 . 5))

(setq default-frame-alist '((internal-border-width . 10)))
(setq resize-mini-windows t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(global-hl-line-mode)

(defvar +font-size-fixed 128)
(defvar +font-size-variable 128)

(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font Mono"
                    :height +font-size-fixed
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :family "JetBrainsMono Nerd Font Mono"
                    :height +font-size-fixed
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :family "JetBrainsMono Nerd Font Mono"
                    :height +font-size-variable
                    :weight 'medium)

(load-theme 'modus-vivendi)

(setq gc-cons-threshold (* 8 1024 1024 1024))
(run-with-idle-timer 10 t (lambda () (garbage-collect)))
(setq read-process-output-max (* 1024 1024))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))

(defvar backup-dir "~/.cache/emacs/")
(unless (file-exists-p backup-dir)
  (make-directory backup-dir))

(setq backup-by-copying t
      backup-directory-alist `((".*" . ,backup-dir))
      delete-old-version t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq sentence-end-double-space nil)
