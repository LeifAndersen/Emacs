(setq viper-mode t)
(require 'viper)
(global-linum-mode t)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default tab-width 4)
(set-default-font "Monospace 14")
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

;; Spell checking
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'verilog-mode 'flyspell-prog-mode)

;; Convenience Keybindings
(global-set-key "\C-c\C-v\C-v" 'compile)
(global-set-key "\C-c\C-v\C-c" 'gdb)
(global-set-key "\C-c\C-v\C-z" 'shell)

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

;; Emacs Plugins
(add-to-list 'load-path "~/.emacs.d/")
(load-file "~/geiser-0.2.1/elisp/geiser.el")
(load "quack.el")
(require 'quack)
(add-to-list 'load-path "~/.emacs.d/scala-mode/")
(add-to-list 'load-path "~/.emacs.d/ensime-master/src/main/elisp/")
(require 'scala-mode-auto)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-to-list 'load-path "~/magit-1.2.0")
(require 'magit)
(require 'magit-svn)
(require 'magit-topgit)
(require 'magit-stgit)
(add-to-list 'load-path "~/emacs-jabber-0.8.91")
(load "jabber-autoloads")
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
;(add-to-list 'load-path "~/gnutls-3.1.3")
;(load "~/nxhtml/autostart.el")

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "cmake-mode.el" t)

;; For CEDET
(load-file "~/cedet-1.1/common/cedet.el")
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

