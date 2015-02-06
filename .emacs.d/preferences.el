;; Preferences
(global-linum-mode t)
(setq c-default-style "linux"
      c-basic-offset 2)
(setq-default tab-width 8)
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
(tool-bar-mode -1)
;;(menu-bar-mode -99)
