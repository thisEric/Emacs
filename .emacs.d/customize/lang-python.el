(defun my:lang_python_config()
  (message "set up python config")
  (elpy-enable)
  ;;(highlight-indentation-mode)
  (setq elpy-rpc-backend "jedi")
  (elpy-use-cpython "/usr/bin/python3")
  ;;setup jedi

  (require 'jedi)
  (require 'python-environment)
  (setq jedi:complete-on-dot t)
  (setq jedi:environment-root "jedi")
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/bin/python3")))
  (add-to-list 'ac-sources 'ac-source-jedi-direct)
  (jedi:setup)
  )

(add-hook 'python-mode-hook 'my:lang_python_config)
(add-hook 'python-mode-hook 'elpy-enable)
