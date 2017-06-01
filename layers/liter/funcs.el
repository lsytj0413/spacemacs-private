;;; funcs.el --- liter Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 lsytj0413
;;
;; Author: zilongshanren <guanghui8827@gmail.com>
;; URL: https://github.com/lsytj0413/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun liter/markdown-to-html ()
  (interactive)
  ;; (start-process "grip" "*gfm-to-html*" "grip" (buffer-file-name) "5000")
  ;; (browse-url (format "http://localhost:5000/%s.%s" (file-name-base) (file-name-extension (buffer-file-name))))
  (start-process "grip" "*gfm-to-html*" "grip" (buffer-file-name) "--export"
                 (format "%s.html" (file-name-base)))
  )
