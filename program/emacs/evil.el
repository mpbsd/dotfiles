(require 'package)
(add-to-list 'package-archives '("G" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("M" . "https://melpa.org/packages/")    t)
(add-to-list 'package-archives '("O" . "https://orgmode.org/packages/")  t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq frame-resize-pixelwise t)

(setq inhibit-startup-message t)

(menu-bar-mode   -1)
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

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
(use-package default-text-scale
             :bind (("C-0" . default-text-scale-reset)
                    ("C--" . default-text-scale-decrease)
                    ("C-=" . default-text-scale-increase)))

(use-package gruvbox-theme)
(load-theme 'gruvbox t)

(use-package spacious-padding
             :ensure t
             :config
             ;; These are the default values, but I keep them here for
             ;; visibility. Also check `spacious-padding-subtle-frame-lines'.
             (setq spacious-padding-widths
                   '( :internal-border-width 15
                                             :header-line-width 4
                                             :mode-line-width 6
                                             :custom-button-width 3
                                             :tab-width 4
                                             :right-divider-width 30
                                             :scroll-bar-width 8
                                             :fringe-width 8))
             (spacious-padding-mode 1)
             ;; Set a key binding if you need to toggle spacious padding.
             (define-key global-map (kbd "<f8>") #'spacious-padding-mode))

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package evil
             :init
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             (setq evil-want-C-i-jump nil)
             :config
             (evil-mode 1)
             (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
             (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
             (evil-global-set-key 'motion "j" 'evil-next-visual-line)
             (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
             (evil-set-initial-state 'messages-buffer-mode 'normal)
             (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
             :after evil
             :config
             (evil-collection-init))

(use-package evil-tutor)
