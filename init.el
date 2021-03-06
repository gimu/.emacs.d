;;; custom emacs config
;;; https://github.com/gimu/.emacs.d

;; Interface modification
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Indentation
(setq-default indent-tabs-mode nil) ;; Disable tabs
(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)

;; Haskell indentation
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; Automatic brackets
(electric-pair-mode 1)

;; Disable splash screen
(setq inhibit-startup-message t)

;; Create the backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves")))

;; Load path
(let ((default-directory user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "lisp")))

;; Init melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Load configurations
(require 'init-appearance) 
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-neotree)
(require 'init-git)

(require 'init-org-mode)
(require 'init-markdown)
(require 'init-sh-mode)
(require 'init-c-mode)
(require 'init-c++-mode)
(require 'init-python-mode)
(require 'init-mmm-mode)

(require 'init-key-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
