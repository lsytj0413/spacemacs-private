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

;; TODO: macro
(defun liter/org-insert-heading-1 ()
  (interactive)
  (liter/org-insert-heading-n 1)
  )

(defun liter/org-insert-heading-2 ()
  (interactive)
  (liter/org-insert-heading-n 2)
  )

(defun liter/org-insert-heading-3 ()
  (interactive)
  (liter/org-insert-heading-n 3)
  )

(defun liter/org-insert-heading-4 ()
  (interactive)
  (liter/org-insert-heading-n 4)
  )

(defun liter/org-insert-heading-n (count)
  (interactive "nHeading Level: \n")
  (cond ((or (> count 10) (< count 1))
         (message "Heading Level must be in [1..10]"))
        (t
         (insert (concat (make-string count ?*) " "))))
  )

(defun liter/cleanup-recentf ()
  (progn
    (and (fboundp 'recentf-cleanup)
         (recentf-cleanup)))
  )

(add-hook 'kill-emacs-hook #'liter/cleanup-recentf)
