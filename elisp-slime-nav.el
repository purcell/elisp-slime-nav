;;; elisp-slime-nav.el --- Make M-. and M-, work in elisp like they do in slime
;;
;; Author: Steve Purcell <steve@sanityinc.com>
;; Keywords: navigation slime elisp emacs-lisp
;; URL: https://github.com/purcell/elisp-slime-nav
;; Version: 0.1
;;
;;; Commentary
;;
;; This package provides Slime's convenient "M-." and "M-," navigation
;; in `emacs-lisp-mode'.
;;
;; Usage:
;;   (require 'elisp-slime-nav)
;;   (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
;;; Code
(defvar elisp-slime-nav-mode-map (make-keymap))

;;;###autoload
(define-minor-mode elisp-slime-nav-mode
  "Enable Slime-style navigation of elisp symbols using M-. and M-,"
  nil " SliNav" elisp-slime-nav-mode-map)

(require 'etags)

;;;###autoload
(defun elisp-slime-nav-find-elisp-thing-at-point ()
  "Jump to the elisp thing at point, whether it's a function,
variable, library or face."
  (interactive)
  (let ((sym (symbol-at-point)))
    (when sym
      (ring-insert find-tag-marker-ring (point-marker))
      (cond
       ((fboundp sym) (find-function sym))
       ((boundp sym) (find-variable sym))
       ((or (featurep sym) (locate-library (symbol-name sym)))
        (find-library (symbol-name sym)))
       ((facep sym)
        (find-face-definition sym))
       (:else
        (progn
          (pop-tag-mark)
          (error "Don't know how to find '%s'" sym)))))))

(define-key elisp-slime-nav-mode-map (kbd "M-.") 'elisp-slime-nav-find-elisp-thing-at-point)
(define-key elisp-slime-nav-mode-map (kbd "M-,") 'pop-tag-mark)


(provide 'elisp-slime-nav)
;;; elisp-slime-nav.el ends here
