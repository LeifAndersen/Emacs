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
   rudel
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
   ensime))

;; El-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-notify-type 'message)
(unless (require 'el-get nil 'noerror)
 (with-current-buffer
  (url-retrieve-synchronously
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
  (let (el-get-master-branch)
   (goto-char (point-max))
   (eval-print-last-sexp))))

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

;; Other elisp packages
(add-to-list 'load-path "~/.emacs.d/")
(load-library "k-mode")
(load-library "k3-mode")
(load-file "~/.emacs.d/show-whitespace-mode.el")
(load-file "~/.emacs.d/shill-mode.el")
(load-file "~/.emacs.d/scribble.el")
(load-file "~/.emacs.d/yaml-mode.el")

; Custon package specific init/prefs
(load-file "~/.emacs.d/include-viper.el")
(load-file "~/.emacs.d/processing-init.el")
(load-file "~/.emacs.d/jabber-init.el")
(load-file "~/.emacs.d/tex-init.el")
(load-file "~/.emacs.d/paredit-prefs.el")
(load-file "~/.emacs.d/k-init.el")

;; Set auto-mode-alist
(setq auto-mode-alist
      (append
       '(("\\.rkt$"     . racket-mode)
         ("\\.php\\'"   . html-mode)
         ("\\.cu$"      . c-mode)
         ("\\.inc$"     . c-mode)
         ("\\.rss$"     . xml-mode)
         ("\\.scrbl"    . scribble-mode)
         ("\\.verilog$" . verilog-mode)
         ("\\.k$"       . k3-mode))
       auto-mode-alist))

;; Spell checking
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'writegood-mode)
(add-hook 'bibtex-mode-hook 'flyspell-mode)
(add-hook 'bibtex-mode-hook 'writegood-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'writegood-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdwon-mode-hook 'writegood-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'verilog-mode 'flyspell-prog-mode)
(add-hook 'java-mode-hook 'flyspell-prog-mode)
(add-hook 'processing-mode-hook 'flyspell-prog-mode)
(add-hook 'scala-mode-hook 'flyspell-prog-mode)
(add-hook 'scheme-mode-hook 'flyspell-mode)
(add-hook 'racket-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mod)
(add-hook 'scribble-mode-hook 'flyspell-mode)
(add-hook 'scribble-mode-hook 'writegood-mode)

;; Preferences
(exec-path-from-shell-copy-env "PATH")
(global-linum-mode t)
(setq c-default-style "linux"
      c-basic-offset 2)
(setq-default tab-width 4)
(unless (eq system-type 'darwin)
  (set-default-font "Monospace 16"))
(when (eq system-type 'darwin)
  (set-default-font "Monospace 25"))
(show-paren-mode t)
(setq snake-score-file
      "~/.emacs.d/snake-scores")
(setq tetris-score-file
      "~/.emacs.d/tetris-scores")
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(column-number-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

; Up max space
(setq max-lisp-eval-depth '40000)
(setq max-specpdl-size '100000)

(defun tab-width-2 ()
  "Set tab width to 2"
  (interactive)
  (setq-default tab-width 2))

(defun tab-width-4 ()
  "Set tab width to 4"
  (interactive)
  (setq-default tab-width 4))

(defun tab-width-8 ()
  "Set tab width to 8"
  (interactive)
  (setq-default tab-width 8))

(defun c-offset-2 ()
  "Set the c-basic-offset to 2"
  (interactive)
  (setq c-basic-offset 2))

(defun c-offset-4 ()
  "Set the c-basic-offset to 4"
  (interactive)
  (setq c-basic-offset 4))

;; A bit for CEDET.
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

;; Convenience Keybindings
(global-set-key "\C-c\C-v\C-v" 'compile)
(global-set-key "\C-c\C-v\C-c" 'gdb)
(global-set-key "\C-c\C-v\C-z" 'shell)
(global-set-key "\M-u" 'ucs-insert)
(global-set-key "\C-c\C-c\C-c" 'set-input-method)

;; Verilog Mode Stuff
(setq verilog-indent-level             4
      verilog-indent-level-module      4
      verilog-indent-level-declaration 4
      verilog-indent-level-behavioral  4
      verilog-indent-level-directive   4
      verilog-case-indent              4
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   nil
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              '(all))
;(setq verilog-indent-level             4
;      verilog-indent-level-module      4
;      verilog-indent-level-declaration 4
;      verilog-indent-level-behavioral  4
;      verilog-indent-level-directive   4
;      verilog-case-indent              4
;      verilog-auto-newline             nil
;      verilog-auto-indent-on-newline   nil
;      verilog-tab-always-indent        t
;      verilog-auto-endcomments         t
;      verilog-minimum-comment-distance 40
;      verilog-indent-begin-after-if    t
;      verilog-auto-lineup              '(all))

;; Greek Keybindings
(global-set-key (kbd "<f9>") "λ")
(global-set-key (kbd "<f8>") "δ")
(global-set-key (kbd "<f7>") "κ")
(global-set-key (kbd "<f6>") "ρ")
(global-set-key (kbd "<f5>") "ς")
(global-set-key (kbd "<C-f12>") "σ")
(global-set-key (kbd "<C-f11>") "Δ")
(global-set-key (kbd "<C-f10>") "Ω")
(global-set-key (kbd "<C-f9>") "ω")
(global-set-key (kbd "<C-f8>") "π")
(global-set-key (kbd "<c-f7>") "π")
(global-set-key (kbd "<c-f6>") "θ")
(global-set-key (kbd "<c-f5>") "θ")
(global-set-key (kbd "<c-f4>") "μ")
(global-set-key (kbd "<C-f3>") "Γ")
(global-set-key (kbd "<C-f2>") "γ")
(global-set-key (kbd "<C-f1>") "ε")
(global-set-key (kbd "<M-f12>") "ϵ")
(global-set-key (kbd "<M-f11>") "Σ")

;; Emacs Plugins
(require 'generic-x)
(load-file "~/.emacs.d/racodoc.el")
;;(add-to-list 'load-path "~/gnutls-3.1.3")
;;(load "~/nxhtml/autostart.el")

; Fill Column Indicators
; (add-to-list 'load-path "~/.emacs.d/Fill-Column-Indicator")
; (require 'fill-column-indicator)
; (add-hook 'after-change-major-mode-hook 'fci-mode)
; (add-hook 'c-mode-hook 'fci-mode)
; (define-globalized-minor-mode global-fci-mode fci-mode
;   (lambda () (fci-mode 1)))
; (global-fci-mode 1)
; (setq fci-rule-column 80)

(add-to-list 'load-path "~/.emacs.d/apel-10.8")
(add-to-list 'load-path "~/.emacs.d/emi-1.14.6")
(add-to-list 'load-path "~/.emacs.d/flim-1.14.9")

(require 'newsticker)
(setq newsticker-html-renderer 'w3m-region)
(setq newsticker-retrieval-interval 600)
(setq newsticker-url-list-default nil)
(load-file "~/.emacs.d/opmlimport.el")
(when (file-exists-p "~/subscriptions.xml")
  (setq newsticker-url-list (opml-to-newsticker "~/subscriptions.xml")))
(when (file-exists-p "~/Dropbox/subscriptions.xml")
  (setq newsticker-url-list (opml-to-newsticker "~/Dropbox/subscriptions.xml")))
(global-set-key (kbd "C-c r") 'newsticker-treeview)
(global-set-key (kbd "C-c C-r") 'newsticker-treeview)
;(newsticker-start)

;(setq-default mode-line-format
;  (list
;    '(:eval (let ((unread (or (newsticker--stat-num-items-total 'new)
;                              0)))
;              (when (> unread 0)
;                (propertize
;                  ; Any text will do, be creative!
;                  (format "RSS: %d" unread)
;                  'face 'some-colorful-font-face
;                  'help-echo (format "You have %d unread RSS items!"
;                                     unread)
;                  'mouse-face 'mode-line-highlight))))))

;; Proper xterm mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mode (e))
  (setq mouse-sel-mode t))

(global-set-key [mouse-4] '(lambda ()
                             (interactive)
                             (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
                             (interactive)
                             (scroll-up 1)))

(unless (eq system-type 'darwin)
  (global-set-key [C-mouse-4]   'text-scale-increase)
  (global-set-key [C-mouse-5]   'text-scale-decrease))
(when (eq system-type 'darwin)
  (global-set-key [M-wheel-up]   'text-scale-increase)
  (global-set-key [M-wheel-down] 'text-scale-decrease))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-decrease)
;(global-set-key [C-=] 'text-scale-increase)
;(global-set-key [C-+] 'text-scale-increase)
;(global-set-key [C--] 'text-scale-decrease)
;(global-set-key [C-_] 'text-scale-decrease)

; Better font and zooming
(when window-system
  (unless (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 16"))
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 25" :height 240)))
(load-file "~/.emacs.d/better-zoom.el")

(defun tex-input ()
  "Set the input mode to TeX style input."
  (interactive)
  (set-input-method 'TeX))

(defun non-tex-input ()
  "Set the input mode to not TeX input."
  (interactive)
  (set-input-method 'latin-prefix))

(global-set-key (kbd "M-c") 'tex-input)
(global-set-key (kbd "M-v") 'non-tex-input)

;; Org mode
                                        ;(org-indent-mode t)
                                        ;(add-hook 'org-mode-hook (lambda ()
                                        ;                           (org-indent-mode t))
                                        ;          t)
;; Use toggle-truncate lines to turn on and off line wrapping.
(setq org-startup-indented t)
;(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))
;(add-to-list 'org-export-latex-classes
;             '("article"
;               "\\documentclass{article}"
;               ("\\section{%s}" . "\\section*{%s}")
;               ("\\subsection{%s}" . "\\subsection*{%s}")
;               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;               ("\\paragraph{%s}" . "\\paragraph*{%s}")
;               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;             '("IEEE"
;               "\\documentclass[onecolumn,12pt]{IEEEtran}"
;               ("\\section{%s}" . "\\section*{%s}")
;               ("\\subsection{%s}" . "\\subsection*{%s}")
;               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;               ("\\paragraph{%s}" . "\\paragraph*{%s}")
;               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Graphviz
(setq graphviz-dot-auto-indent-on-semi nil)

;; For CEDET
(require 'semantic-ia)
(require 'semantic-gcc)
(global-ede-mode 1)
                                        ;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
                                        ;(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)
                                        ;(semantic-idle-completions-mode 1)
(add-hook 'c-mode-common-hook (lambda ()
                                (local-set-key [(control return)] 'semantic-ia-complete-symbol)
                                (local-set-key "\C-c?"            'semantic-ia-complete-symbol-menu)
                                (local-set-key "\C-c>"            'semantic-complete-analyze-inline)
                                (local-set-key "\C-cp"            'semantic-analyze-proto-impl-toggle)
                                (local-set-key "\C-cf"            'semantic-ia-fast-jump)
                                (local-set-key "\C-xp"            'semantic-complete-analyze-inline-idle)))
;(add-hook 'c-mode-common-hook (lambda ()
;                                (local-set-key "." 'semantic-complete-self-insert)
;                                (local-set-key ">" 'semantic-complete-self-insert)))

(require 'geiser-impl)
(require 'quack)
(quack-add-auto-mode-alist '(("\\.ms\\'"  . scheme-mode)))
(geiser-impl--add-to-alist 'regexp "\\.ms$" 'racket t)
(quack-add-auto-mode-alist '(("\\.plot\\'"  . scheme-mode)))
(geiser-impl--add-to-alist 'regexp "\\.plot$" 'racket t)
(unless (eq system-type 'darwin)
  (set-default-font "Monospace 16"))
(when (eq system-type 'dawrin)
  (set-default-font "Monospace 25"))


(when (eq system-type 'darwin)
; setting Super & Hyper keys for Apple keyboard, for emacs running in OS X
  (setq mac-command-modifier 'meta) ; sets the Command key to Meta
  (setq mac-option-modifier 'super) ; sets the Option key to Super
  (setq mac-control-modifier 'control) ; sets the Control key to Control
  (setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper
)

(defun fix-font ()
  "Temporary function to fix small font when opening a new window"
  (interactive)
  (unless (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 16"))
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 25" :height 240)))

(defun call-drracket (text)
  (shell-command (concat "drracket -- '" text "' &")))

(defun drracket ()
  "Open Drracket With current file"
  (interactive)
  (call-drracket (buffer-file-name)))

(setq racket-mode-pretty-lambda nil)

(setq auto-mode-alist
      (append
       '(("\\.rkt$"     . racket-mode)
         ("\\.php\\'"   . html-mode)
         ("\\.cu$"      . c-mode)
         ("\\.inc$"     . c-mode)
         ("\\.rss$"     . xml-mode)
         ("\\.scrbl"    . scribble-mode)
         ("\\.verilog$" . verilog-mode)
         ("\\.k$"       . k3-mode))
       auto-mode-alist))
