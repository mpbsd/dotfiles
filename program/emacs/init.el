(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "evil.org" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
