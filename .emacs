;;set http proxy
(setq url-proxy-services '(("http"  . "")
                           ("https" . "")))

;;initialize package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

;;set backup directory
(setq make-backup-files nil)
(let* ((dir (concat "/tmp/emacs/"
                    (format-time-string "%y-%m-%d"))))
  (make-directory dir "/tmp/emacs")
  (setq backup-directory-alist
        `((".*" . ,dir)))
  (setq auto-save-file-name-transforms
        `((".*" ,dir t)))
  )

;;set font
;(add-to-list 'default-frame-alist
;             '(font . "Inconsolata-14:widthtype='semicondensed' "))

;enable full screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "132ccc75b7fdcd9f5979329620a1151953a8f65efad06b988deed7cba9338eab" "3164a65923ef23e0f3dff9f9607b4da1e07ef1c3888d0f6878feef6c28357732" "ab3e4108e9b6d9b548cffe3c848997570204625adacef60cbd50a39306866db1" default)))
 '(global-nlinum-mode t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "white" :foreground "blue"))))
 '(helm-visible-mark ((t (:background "orange1" :foreground "magenta"))))
 '(iedit-occurrence ((t (:inherit highlight :background "lime green"))))
 '(minibuffer-prompt ((t (:foreground "green"))))
 '(which-func ((t (:foreground "yellow")))))


; enable show paren mode
(show-paren-mode t)
(electric-pair-mode t)
(setq blink-matching-delay 0.1)

;display file path in frame title
(setq-default frame-title-format "%b (%f)")
;disable toolbar
(tool-bar-mode -1)

;set tab default width 
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-width 4)
;inhibit startup screen
(setq inhibit-startup-screen t)
;auto load buffers after changed
(global-auto-revert-mode t)

;load theme
;(load-theme 'tango-dark t)
;(load-theme 'smyx t)
;change the color for comment
(set-face-foreground 'font-lock-comment-face "#509090")

;helm settings
(require 'helm)
(require 'helm-config)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

; start yasnippet with emacs
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t) ;[default: nil]
;;(setq yas-snippet-dirs "/home/eric/.emacs.d/elpa/yasnippet-20150415.244/snippets")
(yas-global-mode 1)
;(yas-load-directory "/home/ccb/.emacs.d/elpa/yasnippet-20141102.1554/snippets/")

;disable yas for term-mode
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

; start auto-complete with emacs
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		  (add-to-list 'ac-sources 'ac-source-gtags)
          (ggtags-mode 1))))

;turn on helm-projectile
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq helm-projectile-sources-list '(helm-source-projectile-projects
                                     helm-source-projectile-files-list))

(setq projectile-globally-ignored-files
      (append projectile-globally-ignored-files '("GPATH" "GTAGS" "GRTAGS"))
      )

(setq projectile-globally-ignored-directories
      (append projectile-globally-ignored-directories '(".repo"))
      )
;turn on which function mode
;;(which-function-mode)
;;(setq mode-line-misc-info (delete (assoc 'which-func-mode
;;                                      mode-line-misc-info) mode-line-misc-info)
;;      which-func-header-line-format '(which-func-mode ("##Current Func:" which-func-format)))

;;(defadvice which-func-ff-hook (after header-line activate)
;;  (when which-func-mode
;;    (setq mode-line-misc-info (delete (assoc 'which-func-mode
;;                                          mode-line-misc-info) mode-line-misc-info)
;;          header-line-format which-func-header-line-format)))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;(setq scroll-preserve-screen-position t)

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;load key binding config
(load "~/.emacs.d/customize/key-binding.el")
;;load c-c++ programming config
(load "~/.emacs.d/customize/lang-c_cpp.el")
;;load python programming config
(load "~/.emacs.d/customize/lang-python.el")

; load projects
(add-to-list 'load-path "~/.emacs.d/customize/")
;;(require 'load-projects)

;;CMake configuration
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(require 'cmake-mode)
