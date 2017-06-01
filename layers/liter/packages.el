;;; packages.el --- liter layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <Administrator@LSYTJ>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `liter-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `liter/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `liter/pre-init-PACKAGE' and/or
;;   `liter/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst liter-packages
  '(
    google-c-style
    ;; json-mode
    markdown-mode
    )
  "The list of Lisp packages required by the liter layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun liter/init-google-c-style ()
  (use-package google-c-style
    :defer t
    :init
    (progn
      (add-hook 'c-mode-common-hook 'google-make-newline-indent)
      (add-hook 'c-mode-common-hook (lambda ()
                                      (google-set-c-style)
                                      (setq c-basic-offset 4)
                                      (c-set-offset 'access-label -4)
                                      (c-set-offset 'case-label 0)))
      )
    ))


;; (defun liter/init-json-mode ()
;;   (use-package json-mode
;;     :defer t
;;     :init
;;     (progn
;;       (add-hook 'json-mode-hook (lambda ()
;;                                   (defconst json-mode-comments-re
;;                                     (rx (group "//" (zero-or-more nonl) line-end)))
;;                                   (push (list json-mode-comments-re 1 font-lock-comment-face)
;;                                         json-font-lock-keywords-1)))
;;       )
;;     ))

(defun liter/post-init-markdown-mode ()
  (progn
    (with-eval-after-load 'markdown-mode
      (progn
        (spacemacs/set-leader-keys-for-major-mode 'gfm-mode
          "p" 'liter/markdown-to-html)
        (spacemacs/set-leader-keys-for-major-mode 'markdown-mode
          "p" 'liter/markdown-to-html)
        ))
    )
  )

;;; packages.el ends here
