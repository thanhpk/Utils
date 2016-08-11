
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(fill-nobreak-invisible t)
 '(indent-tabs-mode t)
 '(js-indent-level 2)
 '(standard-indent 2)
 '(tab-width 2)
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-comment ((t (:background "white" :foreground "black"))))
 '(font-lock-builtin-face ((t (:foreground "cyan" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "green"))))
 '(font-lock-function-name-face ((t (:foreground "magenta" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "blue" :weight normal))))
 '(font-lock-string-face ((t (:foreground "blue"))))
 '(font-lock-type-face ((t (:foreground "cyan"))))
 '(font-lock-variable-name-face ((t (:foreground "black" :weight light))))
 '(nobreak-space ((t (:background "magenta")))))


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path "~/elisp")
(require 'php-mode)

(add-to-list 'load-path "~/elisp")
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
