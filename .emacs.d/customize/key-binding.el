;; key binding for helm
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; key binding for yasnippet
(global-set-key (kbd "C-c y") 'helm-yas-complete)

;; key binding for iedit-mode 
(global-set-key (kbd "C-c ;") 'iedit-mode)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c SPC") 'set-mark-command)

;; key binding for ace-window, overwrite default c-x o
(global-set-key (kbd "C-x o") 'ace-window)

;; key binding for hide-show minor mode
(add-hook 'prog-mode-hook
          (lambda ()
            (hs-minor-mode t)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)
            ))

;;user defined key binding
(add-to-list 'load-path "~/.emacs.d/customize/")
(require 'ccb-package)
(global-set-key (kbd "C-c l") 'ccb-insert-log)
