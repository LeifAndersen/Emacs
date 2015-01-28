(defun call-drracket (text)
  (shell-command (concat "drracket -- '" text "' &")))

(defun drracket ()
  "Open Drracket With current file"
  (interactive)
  (call-drracket (buffer-file-name)))

(setq racket-mode-pretty-lambda nil)

(put 'test-case 'racket-indent-function 1)
(put 'test-suite 'racket-indent-function 1)
