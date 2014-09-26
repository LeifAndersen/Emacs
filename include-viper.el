(setq viper-mode t)
(require 'viper)

(load-file "~/.emacs.d/paredit-viper-compat.el")

(eval-after-load 'paredit
  '(progn
     (require 'paredit-viper-compat)
     (add-hook 'paredit-mode-hook #'paredit-viper-compat)))
