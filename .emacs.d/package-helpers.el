;; Packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun better-package-install (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(defun better-package-install-list (packages)
  (if packages
      (progn
	(better-package-install      (car packages))
	(better-package-install-list (cdr packages)))
    nil))

(better-package-install-list
 '(scala-mode2
   clojure-mode
   haskell-mode
   exec-path-from-shell
   jabber
   writegood-mode
   flycheck
   racket-mode
   magit
   markdown-mode
   quack
   geiser
   dash
   litable
   cmake-mode
   csharp-mode
   ssh-config-mode
   glsl-mode
   arduino-mode
   processing-mode
   yasnippet
   auctex
   paredit
   w3m
   ensime
   evil))
