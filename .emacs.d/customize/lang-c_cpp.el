(defun my:lang_c_cpp_config()
  ; start google-c-style with emacs
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  (setq c-basic-offset 4)
  (c-set-offset 'innamespace 0)
  ; turn on Semantic
  (semantic-mode 1)
  ; let's define a function which adds semantic as a suggestion backend to auto complete
  ; and hook this function to c-mode-common-hook
  (add-to-list 'ac-sources 'ac-source-semantic)
  ; turn on automatic reparsing of open buffers in semantic
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-idle-summary-mode 1)
  ;;(global-semantic-highlight-func-mode t)
  ;turn on which function mode
  (which-function-mode)
  (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                           mode-line-misc-info) mode-line-misc-info)
        which-func-header-line-format '(which-func-mode ("##Current Func:" which-func-format)))

  (defadvice which-func-ff-hook (after header-line activate)
    (when which-func-mode
      (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                               mode-line-misc-info) mode-line-misc-info)
            header-line-format which-func-header-line-format)))
  )

;helm-gtags
(add-hook 'c-mode-hook   'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)


(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode)
          (my:lang_c_cpp_config)
          )))
