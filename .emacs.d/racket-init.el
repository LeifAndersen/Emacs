(defun call-drracket (text)
  (shell-command (concat "drracket -- '" text "' &")))

(defun call-drracket-osx (text)
  (shell-command (concat "open -- '" text "'")))

(defun drracket ()
  "Open Drracket With current file"
  (interactive)
  (unless (eq system-type 'darwin)
    (call-drracket (buffer-file-name)))
  (when (eq system-type 'darwin)
    (call-drracket-osx (buffer-file-name))))

(setq racket-mode-pretty-lambda nil)

(put 'test-case 'racket-indent-function 1)
(put 'test-suite 'racket-indent-function 1)
(put 'compiler-test 'racket-indent-function 1)
(put 'splicing-let-syntax 'racket-indent-function 1)
(put 'splicing-let 'racket-indent-function 1)
