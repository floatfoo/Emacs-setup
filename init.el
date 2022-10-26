;; disable backup files
(setq make-backup-files nil)

;; Set font and its size
(set-frame-font "Hack Nerd Font 13" nil t)

;; display line numbers
(setq display-line-numbers `relative)

;; Just cleaning up an interface
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; theme
(load-theme 'deeper-blue)

;; smooth scrolling
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; straight.el initialization
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; staright.el packages
(straight-use-package 'evil)
(straight-use-package 'projectile)
(straight-use-package 'treemacs)
(straight-use-package 'pdf-tools)
(straight-use-package 'lsp-mode)
(straight-use-package 'magit)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'minimap)
(straight-use-package 'flycheck)
(straight-use-package 'vim-empty-lines-mode)
(straight-use-package 'smartparens)
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'swiper)


;; enable vim tildas
(global-vim-empty-lines-mode)

;; smartparens global-mode
(smartparens-global-mode t)

;; ENTER key parents autoinden 
(defun indent-between-pair (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-local-pair 'prog-mode "{" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "[" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "(" nil :post-handlers '((indent-between-pair "RET")))

(require 'evil)
(evil-mode 1)
(ivy-mode 1)

;; key settings
(global-set-key
 (kbd "C-x w d")
 'delete-window
 )

(global-set-key
 (kbd "C-s")
 'swiper
 )

(global-set-key
 (kbd "<escape>")
 'keyboard-escape-quit
 )
