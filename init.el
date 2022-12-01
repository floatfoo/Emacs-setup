;; disable backup files
(setq make-backup-files nil)

;; Set font and its size
;;(set-frame-font "Hack Nerd Font 13" nil t) ;; emacsclient zoomed out
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font 13"))

;; display line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; disable lines for some modes
(dolist (mode '(org-mode-hook
		vterm-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Just cleaning up an interface
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; opacity
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

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

;; said to set before loading doom-modeline
(setq doom-modeline-support-imenu t)

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
(straight-use-package 'doom-modeline)
(straight-use-package 'doom-themes)
(straight-use-package 'vterm)
(straight-use-package 'which-key)
(straight-use-package 'ivy-rich)
(straight-use-package 'helpful)
;; for the first-time usage run
;; M-x all-the-icons-install-fonts
(straight-use-package 'all-the-icons)


;; flycheck
(global-flycheck-mode 1)

;; ivy-rich mode
(ivy-rich-mode t)

;; which-key config
(which-key-mode 1)

;; enable vim tildas
(global-vim-empty-lines-mode)

;; smartparens global-mode
(smartparens-global-mode t)

;; doom-modeline init
(doom-modeline-mode 1)

;; theme
(load-theme 'doom-acario-dark t)

;; projectile
(projectile-mode t)

;; ENTER key parents autoinden 
(defun indent-between-pair (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;; doom-modeline setup
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 4)
(setq doom-modeline-project-detection 'auto)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)

(sp-local-pair 'prog-mode "{" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "[" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "(" nil :post-handlers '((indent-between-pair "RET")))

(require 'evil)
(evil-mode 1)
(ivy-mode 1)
(counsel-mode 1)
(projectile-mode +1)

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
 (kbd "C-x o")
 'treemacs
 )

(global-set-key
 (kbd "<escape>")
 'keyboard-escape-quit
 )

(global-set-key
 (kbd "C-x p p")
 'projectile-switch-project
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
