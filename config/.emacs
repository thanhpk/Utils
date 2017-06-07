;;; package --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-js2-evaluate-calls t)
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(fci-rule-color "#efefef")
 '(fill-nobreak-invisible nil)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
 '(indent-tabs-mode t)
 '(ido-vertical-show-count t)
 '(js-indent-level 2)
 '(message-default-charset (quote iso-8859-1))
 '(nginx-indent-level 2)
 '(nginx-indent-tabs-mode t)
 '(package-selected-packages
	 (quote
		(avy cql-mode go-eldoc go-guru golint key-chord nginx-mode protobuf-mode go-complete dired-rainbow rainbow-mode web-mode multi-term go-impl go-errcheck php-mode magit jade-mode ## ac-js2 list-packages-ext helm-projectile tide projectile markdown-mode js2-mode go-mode)))
 '(projectile-global-mode t)
 '(scroll-bar-mode nil)
 '(semantic-stickyfunc-indent-string "")
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8)))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "white" :foreground "black" :height 113 :foundry "MS  " :family "Consolas"))))
 '(cursor ((t (:background "orange red"))))
 '(dired-directory ((t (:foreground "blue"))))
 '(flycheck-warning ((t (:underline (:color "gold" :style wave)))))
 '(font-lock-builtin-face ((t (:foreground "DeepPink3" :slant italic :weight normal))))
 '(font-lock-comment-face ((t (:background "#ffffdd" :foreground "#333" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "blue violet"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "DeepPink1" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#2222ff" :weight normal))))
 '(font-lock-string-face ((t (:foreground "dark red" :slant italic :family "consolas"))))
 '(font-lock-type-face ((t (:foreground "dark cyan" :weight normal))))
 '(font-lock-variable-name-face ((t (:foreground "#6b2500"))))
 '(font-lock-warning-face ((t (:foreground "dark gray"))))
 '(ido-subdir ((t (:foreground "blue"))))
 '(js2-external-variable ((t (:foreground "orange"))))
 '(js2-function-call ((t (:foreground "deep pink"))))
 '(js2-function-param ((t nil)))
 '(js2-object-property ((t (:foreground "dark cyan"))))
 '(js2-private-function-call ((t (:foreground "deep pink"))))
 '(nobreak-space ((t (:background "magenta"))))
 '(whitespace-empty ((t nil)))
 '(whitespace-newline ((t (:foreground "white" :weight normal))))
 '(whitespace-space ((t (:foreground "white smoke"))))
 '(whitespace-tab ((t (:foreground "#ffffff")))))

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
;(require 'dockerfile-mode)
;(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; create backup file in tmp directory instead of current directory
(setq backup-directory-alist '(("." . "~/tmp"))
			backup-by-copying t    ; Don't delink hardlinks
			version-control t      ; Use version numbers on backups
			delete-old-versions t  ; Automatically delete excess backups
			kept-new-versions 20   ; how many of the newest versions to keep
			kept-old-versions 5)   ; and how many of the old

;(use-package markdown-mode
;						 :ensure t
;						 :commands (markdown-mode gfm-mode)
;						 :mode (("README\\.md\\'" . gfm-mode)
;										("\\.md\\'" . markdown-mode)
;										("\\.markdown\\'" . markdown-mode))
;						       :init (setq markdown-command "multimarkdown"))
;;; .emacs ends here

(require 'ido)
(ido-mode t)
(ido-vertical-mode t)
;;(setq ido-decorations (quote ("\n🡒 " "" "\n   " "\n   ..." "" "..." " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-truncation ()
	(set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)

;; C-n/p is more intuitive in vertical layout
(defun ido-define-keys ()
	(define-key ido-completion-map (kbd "C-n") 'ido-next-match)
	(define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; display any item that contains the chars you typed
(setq ido-enable-flex-matching t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(projectile-mode t)

(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

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

(global-set-key (kbd "M-o n") 'move-to-next-line)
(global-set-key (kbd "M-o p") 'move-to-prev-line)
(global-set-key (kbd "M-p") 'scroll-down-line-3)
(global-set-key (kbd "M-n") 'scroll-up-line-3)
;(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
;(global-set-key (kbd "M-2") 'delete-window) ; close current pane
;(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-SPC") 'switch-to-buffer)


;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#bababa")
;; (set-face-foreground 'highlight nil)
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

(global-set-key (kbd "C-t") 'select-frame-by-name)

(menu-bar-mode -1)
(setq show-paren-delay 0)
(show-paren-mode 1)

(winner-mode 1)
(windmove-default-keybindings 'meta)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)

(global-set-key (kbd "DEL") 'backward-delete-char)

;(require 'go-autocomplete)
;(require 'auto-complete-config)
;(ac-config-default)

;(defun auto-complete-for-go ()
;	(auto-complete-mode 1))
;(add-hook 'go-mode-hook 'auto-complete-for-go)

;(with-eval-after-load 'go-mode
;	   (require 'go-autocomplete))

(require 'json)
(require 'flycheck)
(defun my-parse-jslinter-warning (warning)
  (flycheck-error-new
   :line (1+ (cdr (assoc 'line warning)))
   :column (1+ (cdr (assoc 'column warning)))
   :message (cdr (assoc 'message warning))
   :level 'error
   :buffer (current-buffer)
   :checker 'javascript-jslinter))

(defun jslinter-error-parser (output checker buffer)
  (mapcar 'parse-jslinter-warning
          (cdr (assoc 'warnings (aref (json-read-from-string output) 0)))))
(flycheck-define-checker javascript-jslinter
  "A JavaScript syntax and style checker based on JSLinter.

See URL `https://github.com/tensor5/JSLinter'."
  :command ("c:/Users/Felix/AppData/Roaming/npm/jslint" "--raw" source)
  :error-parser jslinter-error-parser
  :modes (js-mode js2-mode js3-mode))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.15)
(setq key-chord-one-key-delay 0.2)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;;(key-chord-define-global "" "\C-e")
(key-chord-define-global "qq" 'avy-goto-char)
(key-chord-define-global "jj" 'avy-goto-word-1)
(key-chord-define-global "JJ" 'winner-undo) ;
(key-chord-define-global "zz" 'delete-other-windows) ;; zoom zoom
(key-chord-define-global "vv" 'switch-to-previous-buffer)
;; (key-chord-define-global "tt"
(key-chord-mode +1)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
