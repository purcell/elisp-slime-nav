# Slime-style navigation for Emacs Lisp


Slime allows very convenient navigation to the symbol at point (using
<kbd>M-.)</kbd>, and the ability to pop back to previous marks (using <kbd>M-,</kbd>).

This plugin provides similar navigation for Emacs Lisp, supporting
navigation to the definitions of variables, functions, libraries and
faces.

## Installation

### Manual

Ensure `elisp-slime-nav.el` is in a directory on your load-path, and
add the following to your `~/.emacs` or `~/.emacs.d/init.el`:

``` lisp
(require 'elisp-slime-nav)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
```

### MELPA

If you're an Emacs 24 user or you have a recent version of `package.el`
you can install projectile from the
[MELPA](http://melpa.milkbox.net) repository. The version of
`elisp-slime-nav` there will always be up-to-date. You'll still need to add
the `emacs-lisp-mode-hook` after you've installed the package via MELPA:

``` lisp
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
```

## About

Author: Steve Purcell <steve at sanityinc dot com>
Homepage: https://github.com/purcell/elisp-slime-nav

This little library was extracted from the author's
[full Emacs configuration](https://github.com/purcell/emacs.d), which
readers might find of interest.


