;;;###autoload
(defun ccb-init-package()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
  (package-list-packages)
  )

;;;###autoload
(defun ccb-insert-declaration ()
  (interactive)
  (setq current-pos (point))
  (beginning-of-buffer)
  (insert (format-time-string "%Y-%m-%d"))
  (newline-and-indent)
  (goto-char current-pos)
  )

;;;###autoload
(defun ccb-insert-log()
  (interactive)
  ;;(insert "ALOGI(\"iCCB @file %s, @func %s, @line %d\", 
    ;;       strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__, __FUNCTION__, __LINE__);")
  (insert "ALOGI(\"iCCB  @func %s, @line %d\", 
           __FUNCTION__, __LINE__);")
;;  (newline-and-indent)
  )

(defun ccb-kill-other-buffers()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide 'ccb-package)

