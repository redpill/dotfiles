;; packages.el - load emacs packages

(require 'package)

;; add the melpa package repo
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar _packages
  '(scala-mode2))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      _packages)

(provide 'packages)
;; end of packages.el