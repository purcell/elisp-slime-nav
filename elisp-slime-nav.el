;;; Make M-. and M-, work in elisp like they do in slime
;;;
;;; Author: Steve Purcell <steve at sanityinc dot com>
;;;
;;; Homepage: https://github.com/purcell/elisp-slime-nav
;;;
;;; Usage:
;;;   (require 'elisp-slime-nav)
;;;   (add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))

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
