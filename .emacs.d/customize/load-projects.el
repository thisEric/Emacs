;;;###autoload
(defun load-project-15.33-android()
  (interactive)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-sources-c-headers)
  (global-ede-mode 1)
  
  (require 'cedet-global)
  (when (cedet-gnu-global-version-check t)
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    )
  )

;;;###autoload
(defun load-project-gmin-l ()
  (interactive)
  (message "load gmin-l")
  )

;;;###autoload
(defun load-project-x264()
  (interactive)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-sources-c-headers)
  (add-to-list 'achead:include-directories "/home/eric/Work/SourceCode/x264/")
  (global-ede-mode 1)
  
  (require 'cedet-global)
  (when (cedet-gnu-global-version-check t)
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    )
  (ede-cpp-root-project "X264"
                :name "X264 Project"
                :file "/home/eric/Work/SourceCode/x264/Makefile"
                :include-path '("/")
                )
  )

(provide 'load-projects)
