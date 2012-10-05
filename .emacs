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
      (cons '("\\.verilog$" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.rkt" . scheme-mode) auto-mode-alist))
(column-number-mode)

;; Greek Keybindings
(global-set-key (kbd "<f9>") "λ")
(global-set-key (kbd "<f8>") "σ")
(global-set-key (kbd "<f7>") "κ")
(global-set-key (kbd "<f6>") "ρ")
(global-set-key (kbd "<f5>") "ς")

;; Emacs Plugins
(load-file "~/geiser-0.2.1/elisp/geiser.el")
(add-to-list 'load-path "~/.emacs.d/")
(load "quack.el")
(require 'quack)

;; For CEDET
(load-file "~/cedet-1.1/common/cedet.el")
(require 'semantic-ia)
(require 'semantic-gcc)
(global-ede-mode 1)
;(semantic-load-enable-gaudy-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)
;(semantic-idle-completions-mode 1)
(add-hook 'c-mode-common-hook (lambda ()
                                (local-set-key [(control return)] 'semantic-ia-complete-symbol)
                                (local-set-key "\C-c?"            'semantic-ia-complete-symbol-menu)
                                (local-set-key "\C-c>"            'semantic-complete-analyze-inline)
                                (local-set-key "\C-cp"            'semantic-analyze-proto-impl-toggle)))
(add-hook 'c-mode-common-hook (lambda ()
                                (local-set-key "." 'semantic-complete-self-insert)
                                (local-set-key ">" 'semantic-complete-self-insert)))

