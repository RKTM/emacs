(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Japanese")
 '(custom-enabled-themes (quote (wombat)))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; global
(global-set-key (kbd "<f6>") 'sr-speedbar-toggle)


;; region overwrite
(delete-selection-mode 1)


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


;; mozc(japanese)
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

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
