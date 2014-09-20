(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun better-package-install (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(better-package-install 'scala-mode2)
(better-package-install 'clojure-mode)
(better-package-install 'haskell-mode)
(better-package-install 'exec-path-from-shell)
(better-package-install 'jabber)
(better-package-install 'rudel)
(better-package-install 'writegood-mode)
(better-package-install 'flycheck)
(better-package-install 'racket-mode)

(exec-path-from-shell-copy-env "PATH")
(load-file "~/.emacs.d/include-viper.el")
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
(setq auto-mode-alist
      (cons '("\\.cu$" . c-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.inc$" . c-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.rkt$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.rss$" . xml-mode) auto-mode-alist))
(column-number-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

; Up max space
(setq max-lisp-eval-depth '40000)
(setq max-specpdl-size '100000)

(add-to-list 'load-path "~/.emacs.d/")

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

; Markdown Support
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook
                        'check-parens
                        nil t))))


; Scribble
(load-file "~/.emacs.d/scribble.el")
(add-to-list 'auto-mode-alist '("\\.scrbl" . scribble-mode))

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

;; Convenience Keybindings
(global-set-key "\C-c\C-v\C-v" 'compile)
(global-set-key "\C-c\C-v\C-c" 'gdb)
(global-set-key "\C-c\C-v\C-z" 'shell)
(global-set-key "\M-u" 'ucs-insert)
(global-set-key "\C-c\C-c\C-c" 'set-input-method)

;; Verilog Mode Stuff
(setq auto-mode-alist
      (cons '("\\.verilog$" . verilog-mode) auto-mode-alist))
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
(load-file "~/.emacs.d/shill-mode.el")
(load-file "~/.emacs.d/racodoc.el")
(require 'shill-mode)
(load-file "~/.emacs.d/geiser-0.2.1/elisp/geiser.el")
(load "quack.el")
(require 'quack)
;(add-to-list 'load-path "~/.emacs.d/scala-mode/")
(add-to-list 'load-path "~/.emacs.d/ensime-master/src/main/elisp/")
;(require 'scala-mode-auto)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-to-list 'load-path "~/.emacs.d/magit-1.2.0")
(require 'magit)
(require 'magit-svn)
(require 'magit-topgit)
(require 'magit-stgit)
(add-to-list 'load-path "~/.emacs.d/emacs-jabber-0.8.91")
(load "jabber-autoloads")
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
                                        ;(add-to-list 'load-path "~/gnutls-3.1.3")
                                        ;(load "~/nxhtml/autostart.el")

; Fill Column Indicators
; (add-to-list 'load-path "~/.emacs.d/Fill-Column-Indicator")
; (require 'fill-column-indicator)
; (add-hook 'after-change-major-mode-hook 'fci-mode)
; (add-hook 'c-mode-hook 'fci-mode)
; (define-globalized-minor-mode global-fci-mode fci-mode
;   (lambda () (fci-mode 1)))
; (global-fci-mode 1)
; (setq fci-rule-column 80)

; k-mode
;(setq load-path (cons "path/to/this/file" load-path))
(load-library "k-mode")
;(add-to-list 'auto-mode-alist '("\\.k$" . k-mode)) ;; to launch k-mode for .k files
(setq k-path "~/bin/k-framework") ;; defaults to ~/k-framework

; k3-mode
;(setq load-path (cons "path/to/this/file" load-path))
(load-library "k3-mode")
(add-to-list 'auto-mode-alist '("\\.k$" . k3-mode)) ;; to launch k3-mode for .k files

; Paredit
(load-file "~/.emacs.d/paredit.el")
(load-file "~/.emacs.d/paredit-viper-compat.el")
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(eval-after-load 'paredit
  '(progn
     (require 'paredit-viper-compat)
     (add-hook 'paredit-mode-hook #'paredit-viper-compat)))

(load-file "~/.emacs.d/paredit-prefs.el")

; PHP
(setq auto-mode-alist
      (append
       '(("\\.php\\'" . html-mode))
       auto-mode-alist))

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(autoload 'cmake-mode "cmake-mode.el" t)
(autoload 'csharp-mode "csharp-mode.el" t)
(setq auto-mode-alist
      (append
       '(("\\.cs\\'" . csharp-mode))
       auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/apel-10.8")
(add-to-list 'load-path "~/.emacs.d/emi-1.14.6")
(add-to-list 'load-path "~/.emacs.d/flim-1.14.9")

; Yasnippit
;(add-to-list 'load-path
;              "~/.emacs.d/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)


; Arduino Support
(load-file "~/.emacs.d/arduino-mode.el")
(setq auto-mode-alist (cons '("\\.pde$" . arduino-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ino$" . auto-mode-alist) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

; Processing Support
(add-to-list 'load-path "~/.emacs.d/processing2-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(setq processing-location "~/bin/processing-2.0/processing-java")
(setq processing-application-dir "~/bin/processing-2.0/")
(setq processing-sketch-dir "~/sketchbook")

(autoload 'processing-snippets-initialize "processing-mode" nil nil nil)
(eval-after-load 'yasnippet '(processing-snippets-initialize))

(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary processing-functions)
  (setq ac-user-dictionary (append ac-user-dictionary processing-builtins))
  (setq ac-user-dictionary (append ac-user-dictionary processing-constants)))

(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)

; w3m
(add-to-list 'load-path "~/.emacs.d/emacs-w3m")
;(require 'w3m-load)
;(require 'w3m)
;(require 'mime-w3m)
;(setq mm-text-html-renderer 'w3m)
;(setq browse-url-browser-function 'w3m-browse-url)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;(global-set-key "\C-xm" 'browse-url-at-point)
;(setq w3m-use-cookies t)

(require 'newsticker)
;(require 'w3m)
;(setq newsticker-html-renderer 'w3m-region)
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
;  (global-set-key [mouse-4] '(lambda ()
;                               (interactive)
;                               (scroll-down 1)))
;  (global-set-key [mouse-5] '(lambda ()
;                               (interactive)
;                               (scroll-up 1)))
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

; SSH config fiels
(autoload 'ssh-config-mode "ssh-config-mode" t)
(add-to-list 'auto-mode-alist '(".ssh/config\\'"  . ssh-config-mode))
(add-to-list 'auto-mode-alist '("sshd?_config\\'" . ssh-config-mode))
(add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

; Better font and zooming
(when window-system
  (unless (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 16"))
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Monospace 25" :height 240)))
(load-file "~/.emacs.d/better-zoom.el")

;; Auctex
(when (file-exists-p "~/.emacs.d/auctex-11.87/preview/preview-latex.el")
  (add-to-list 'load-path "~/.emacs.d/auctex-11.87")
  (add-to-list 'load-path "~/.emacs.d/auctex-11.87/preview")
  (add-to-list 'load-path "~/.emacs.d/auctex-11.87/style")
  (add-to-list 'load-path "~/.emacs.d/auctex-11.87/images")
  (add-to-list 'load-path "~/.emacs.d/auctex-11.87/doc")
  (load "auctex.el" nil t t)
  (load "preview-latex.el" nil t t)

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;(setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  ;(setq TeX-engine 'xetex)
  )

(defun tex-engine-xetex ()
  "Set the latex rendering engine to xetex"
  (interactive)
  (setq TeX-engine 'xetex))

;(defun tex-engine (mode)
;  "Set the latex rendering engine"
;  (interactive "sRendering Engine: \n")
;  (setq TeX-engine mode))

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

; Lightable (beta)
(add-to-list 'load-path "~/.emacs.d//")
(load-file "~/.emacs.d/dash.el/dash.el")
(load-file "~/.emacs.d/litable.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-programs (quote ("vicare" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "mzscheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Whiespace
(load-file "~/.emacs.d/show-whitespace-mode.el")

(require 'geiser-impl)
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

(defun jabber ()
  (interactive)
  (jabber-connect)
  (switch-to-buffer "*-jabber-*"))

(setq jabber-account-list
      '(("email@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

(defun call-drracket (text)
  (shell-command (concat "drracket -- '" text "' &")))

(defun drracket ()
  "Open Drracket With current file"
  (interactive)
  (call-drracket (buffer-file-name)))
