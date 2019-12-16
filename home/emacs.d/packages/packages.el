;; packages.el - load emacs packages

(require 'package)

;; add the melpa package repo
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar _packages
  '(auto-package-update
    org
    use-package
    editorconfig
    dracula-theme
    magit
    paredit
    rainbow-delimiters
    company
    dockerfile-mode
    docker-compose-mode
    feature-mode
    go-mode
    clojure-mode
    cider
    web-mode))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      _packages)

;; use-package configs
(eval-when-compile
  (require 'use-package))

;; magit-config
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; paredit configs
(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'paredit-mode)
  (add-hook 'ielm-mode-hook #'paredit-mode)
  (add-hook 'lisp-mode-hook  #'paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode))

;; rainbow-delimiters configs
(use-package rainbow-delimiters
  :ensure t)

;; company
(use-package company
  :ensure t
  :bind (("C-c /" . company-complete))
  :config
  (global-company-mode))

;; clojure-mode configs
(use-package clojure-mode
  :ensure t
  :mode ("\\.clj\\'" . clojure-mode)
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

;; xml mode configs
(use-package xml-mode
  :mode ("\\.wsdl\\'" . xml-mode))

;; web-mode configs
(use-package web-mode
  :mode ("\\.phtml\\'" . web-mode)
  :mode ("\\.tpl\\.php\\'" . web-mode)
  :mode ("\\.[agj]sp\\'" . web-mode)
  :mode ("\\.erbl\\'" . web-mode)
  :mode ("\\.mustache\\'" . web-mode)
  :mode ("\\.djhtml\\'" . web-mode)
  :mode ("\\.html?\\'" . web-mode))

;; Dockerfile-mode configs
(use-package dockefile-mode
  :mode ("\\Dockerfile\\'" . dockerfile-mode))

;; docker-comopose-mode configs
(use-package docker-compose-mode)

;; org-mode configs
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done 'time)

(provide 'packages)
;; end of packages.el
