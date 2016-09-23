
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-js2-evaluate-calls t)
 '(blink-cursor-mode t)
 '(c-basic-offset 2)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
	 (quote
		("169e68f2488144079fdc61fbbbd34643097e1ef1273b442c015159e9f7ad566e" "745873c158637df642e3373f141436fe1ae9b717296b9c2c76fa6f2535a90eac" "ff75994a309305e51b2e38820a426050acd438992cd6b0647c2e3413ec0cb571" "20d76b0b4f556aa943db5b59dc423e54556feb3edd6af4e903bb06c7c831fba7" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" default)))
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible t)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(font-use-system-font t)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(package-selected-packages
	 (quote
		(ac-js2 list-packages-ext helm-projectile tide projectile markdown-mode js2-mode helm go-mode)))
 '(projectile-global-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-comment ((t (:background "white" :foreground "black"))))
 '(font-lock-builtin-face ((t (:foreground "cyan" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "forest green" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "firebrick"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "deep sky blue" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "blue" :weight normal))))
 '(font-lock-string-face ((t (:foreground "red"))))
 '(font-lock-type-face ((t (:foreground "cyan"))))
 '(font-lock-variable-name-face ((t (:foreground "dark orange" :weight light))))
 '(js2-external-variable ((t (:foreground "dark magenta"))))
 '(js2-function-call ((t (:foreground "deep sky blue"))))
 '(js2-function-param ((t nil)))
 '(js2-object-property ((t (:foreground "dark goldenrod"))))
 '(nobreak-space ((t (:background "magenta")))))

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path "~/elisp")
(require 'php-mode)
(require 'go-mode-autoloads)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; create backup file in tmp directory instead of current directory
(setq backup-directory-alist '(("." . "~/tmp"))
			backup-by-copying t    ; Don't delink hardlinks
			version-control t      ; Use version numbers on backups
			delete-old-versions t  ; Automatically delete excess backups
			kept-new-versions 20   ; how many of the newest versions to keep
			kept-old-versions 5    ; and how many of the old
			  )
;(use-package markdown-mode
;						 :ensure t
;						 :commands (markdown-mode gfm-mode)
;						 :mode (("README\\.md\\'" . gfm-mode)
;										("\\.md\\'" . markdown-mode)
;										("\\.markdown\\'" . markdown-mode))
;						       :init (setq markdown-command "multimarkdown"))
;;; .emacs ends here

(setq gofmt-command "goimports")

(require 'ido)
(ido-mode t)

;; make ido display choices vertically
(setq ido-separator "\n")

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 
(require 'color-theme-tomorrow
   (locate-file "color-theme-tomorrow.el" custom-theme-load-path))

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(require 'helm-config)

(projectile-global-mode t)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)


(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(desktop-save-mode 1)

(add-to-list 'load-path "~/elisp/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;(global-set-key [?\C-N] 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window) ; close current pane
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
