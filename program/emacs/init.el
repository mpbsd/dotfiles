(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "evil.org" user-emacs-directory))

(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)
