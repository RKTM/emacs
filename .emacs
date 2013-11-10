(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Japanese")
 '(custom-enabled-themes (quote (wombat)))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; global
(global-set-key (kbd "<f6>") 'sr-speedbar-toggle)

(setq-default tab-width 2 indent-tabs-mode nil)

;; region overwrite
(delete-selection-mode 1)

;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; speedbar
(add-to-list 'load-path "~/.emacs.d/lib/speedbar")
(require 'sr-speedbar)    
(setq sr-speedbar-right-side nil) 
(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension '("js" "as" "html" "css" "php" "scala" "ts"))))

;; tabbar
(add-to-list 'load-path "~/.emacs.d/lib/tabbar")
(require 'tabbar)
(tabbar-mode)
(setq tabbar-buffer-groups-function nil)
(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ
(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
		     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
		     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


;; mozc(japanese)
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)

;; auto-pair
(add-to-list 'load-path "~/.emacs.d/lib/autopair")
(require 'autopair)
(autopair-global-mode) 


;;; development ;;;

;; scala-mode2
(add-to-list 'load-path "~/.emacs.d/lib/scala-mode2")
(require 'scala-mode)

;; ensime
(add-to-list 'load-path "~/.emacs.d/lib/ensime/ensime_2.10.0-0.9.8.9/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; zen-coding
(add-to-list 'load-path "~/.emacs.d/lib/zencoding-mode/")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;; typescript
(add-to-list 'load-path "~/.emacs.d/lib/typescript/")
(autoload 'typescript-mode "typescript-mode" nil t)
(add-to-list 'auto-mode-alist '("\.ts$" . typescript-mode))

;; default encoding
(set-default-coding-systems 'utf-8)
