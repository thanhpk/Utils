;;; package --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-js2-evaluate-calls t t)
 '(blink-cursor-mode t)
 '(c-basic-offset 2)
 '(cursor-type (quote hbar))
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible t)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(font-use-system-font t)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(package-selected-packages
	 (quote
		(go-impl go-errcheck go-autocomplete php-mode magit jade-mode ## ac-js2 list-packages-ext helm-projectile tide projectile markdown-mode js2-mode helm go-mode)))
 '(projectile-global-mode t)
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8)))
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

;(require 'go-mode-autoloads)
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

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

;(setq gofmt-command "goimports")

(require 'ido)
(ido-mode t)

;; make ido display choices vertically
(setq ido-separator "\n")

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(require 'helm-config)

(projectile-global-mode t)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(desktop-save-mode 1)

;; Docker file mode
;; (add-to-list 'load-path "~/elisp/dockerfile-mode")


(defun scroll-up-line-3 ()
  "Upcase the last letter of the word at point."
  (interactive)
  (scroll-up-line)
  (scroll-up-line))

(defun scroll-down-line-3 ()
  "Upcase the last letter of the word at point."
  (interactive)
  (scroll-down-line)
  (scroll-down-line))

(defun move-to-next-line ()
	"Move to next line."
	(interactive)
	(move-end-of-line 1)
	(open-line 1)
	(forward-line)
	(indent-for-tab-command))

(defun move-to-prev-line ()
	"Move to next line."
	(interactive)
	(move-beginning-of-line 1)
	(open-line 1)
	(indent-for-tab-command))

;;(add-to-list 'load-path "~/elisp/neotree")
;;(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)

(global-set-key (kbd "M-o n") 'move-to-next-line)
(global-set-key (kbd "M-o p") 'move-to-prev-line)
(global-set-key (kbd "M-p") 'scroll-down-line-3)
(global-set-key (kbd "M-n") 'scroll-up-line-3)
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window) ; close current pane
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(global-set-key [(meta ?z)] 'delete-backward-char)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#bababa")
(set-face-foreground 'highlight nil)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
))

;; YML YAML mode

(add-hook 'yaml-mode-hook
					(lambda ()
						(define-key yaml-mode-map "\C-m" 'newline-and-indent)))


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
