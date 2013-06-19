(setq viper-mode t)
(require 'viper)
(global-linum-mode t)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default tab-width 4)
;(set-default-font "Monospace 14")
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
      (cons '("\\.rkt$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.rss$" . xml-mode) auto-mode-alist))
(column-number-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(add-to-list 'load-path "~/.emacs.d/")

;; A bit for CEDET.
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")


;; Spell checking
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'verilog-mode 'flyspell-prog-mode)

;; Convenience Keybindings
(global-set-key "\C-c\C-v\C-v" 'compile)
(global-set-key "\C-c\C-v\C-c" 'gdb)
(global-set-key "\C-c\C-v\C-z" 'shell)
(global-set-key "\M-u" 'ucs-insert)

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

;; Greek Keybindings
(global-set-key (kbd "<f9>") "λ")
(global-set-key (kbd "<f8>") "σ")
(global-set-key (kbd "<f7>") "κ")
(global-set-key (kbd "<f6>") "ρ")
(global-set-key (kbd "<f5>") "ς")
(global-set-key (kbd "<C-f12>") "δ")
(global-set-key (kbd "<C-f11>") "Δ")
(global-set-key (kbd "<C-f10>") "Ω")
(global-set-key (kbd "<C-f9>") "ω")
(global-set-key (kbd "<C-f8>") "Π")
(global-set-key (kbd "<C-f7>") "π")
(global-set-key (kbd "<C-f6>") "Θ")
(global-set-key (kbd "<C-f5>") "θ")
(global-set-key (kbd "<C-f4>") "μ")
(global-set-key (kbd "<C-f3>") "Γ")
(global-set-key (kbd "<C-f2>") "γ")
(global-set-key (kbd "<C-f1>") "ε")
(global-set-key (kbd "<M-f12>") "ϵ")
(global-set-key (kbd "<M-f11>") "Σ")

;; Emacs Plugins
(load-file "~/.emacs.d/geiser-0.2.1/elisp/geiser.el")
(load "quack.el")
(require 'quack)
(add-to-list 'load-path "~/.emacs.d/scala-mode/")
(add-to-list 'load-path "~/.emacs.d/ensime-master/src/main/elisp/")
(require 'scala-mode-auto)
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

; k-mode
;(setq load-path (cons "path/to/this/file" load-path))
(load-library "k-mode")
;(add-to-list 'auto-mode-alist '("\\.k$" . k-mode)) ;; to launch k-mode for .k files
(setq k-path "~/bin/k-framework") ;; defaults to ~/k-framework

; k3-mode
;(setq load-path (cons "path/to/this/file" load-path))
(load-library "k3-mode")
(add-to-list 'auto-mode-alist '("\\.k$" . k3-mode)) ;; to launch k3-mode for .k files

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

; Markdown Support
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; Yasnippit
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


; Arduino Support
(load-file "~/.emacs.d/arduino-mode.el")
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
(newsticker-start)

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

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

; SSH config fiels
(autoload 'ssh-config-mode "ssh-config-mode" t)
(add-to-list 'auto-mode-alist '(".ssh/config\\'"  . ssh-config-mode))
(add-to-list 'auto-mode-alist '("sshd?_config\\'" . ssh-config-mode))
(add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

; Better font and zooming
(when window-system
  (set-face-attribute 'default nil :font "Monospace 14"))
(load-file "~/.emacs.d/better-zoom.el")

;; Org mode
                                        ;(org-indent-mode t)
                                        ;(add-hook 'org-mode-hook (lambda ()
                                        ;                           (org-indent-mode t))
                                        ;          t)
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
                                (local-set-key "\C-xp"            'semantic-complete-analyze-inline-idle)))
(add-hook 'c-mode-common-hook (lambda ()
                                (local-set-key "." 'semantic-complete-self-insert)
                                (local-set-key ">" 'semantic-complete-self-insert)))

; Lightable (beta)
(add-to-list 'load-path "~/.emacs.d//")
(load-file "~/.emacs.d/dash.el/dash.el")
(load-file "~/.emacs.d/litable.el")
