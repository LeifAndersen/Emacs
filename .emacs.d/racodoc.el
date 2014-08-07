;; raco docs
;; from ianj

;; ripped from paredit, bleh
(defvar from-paredit-sexp-error-type
  (with-temp-buffer
    (insert "(")
    (condition-case condition
        (backward-sexp)
      (error (if (eq (car condition) 'error)
                 (paredit-warn "%s%s%s%s%s"
                               "Paredit is unable to discriminate"
                               " S-expression parse errors from"
                               " other errors. "
                               " This may cause obscure problems. "
                               " Please upgrade Emacs."))
             (car condition)))))

  (defmacro from-paredit-handle-sexp-errors (body &rest handler)
    `(condition-case ()
         ,body
       (,from-paredit-sexp-error-type ,@handler)))

  (put 'from-paredit-handle-sexp-errors 'lisp-indent-function 1)

  (defmacro from-paredit-ignore-sexp-errors (&rest body)
    `(from-paredit-handle-sexp-errors (progn ,@body)
       nil))

  (put 'from-paredit-ignore-sexp-errors 'lisp-indent-function 0)
;; end rip


(setq raco-doc-history nil)
(defun call-raco-doc (text)
  (shell-command (concat "raco doc -- '" text "'")))

(defun get-current-word ()
  (from-paredit-handle-sexp-errors
   (save-excursion
    (progn (backward-sexp)
           (mark-sexp)
           (buffer-substring (mark) (point))))
    (save-excursion
      (progn (mark-sexp)
             (buffer-substring (mark) (point))))))
(defun raco-doc ()
  "call raco doc on selected text"
  (interactive)
  (call-raco-doc (get-current-word)))
(defun raco-doc-prompt ()
  "call raco doc on prompted text"
  (interactive)
  (let ((text (read-string (if (consp raco-doc-history)
                               (concat "raco doc [" (car raco-doc-history) "]: ")
                               "raco doc: ")
                           nil
                           'raco-doc-history
                           ;; default value should be most recent history item
                           (if (consp raco-doc-history)
                               (car raco-doc-history)
                               nil)
                           t))) ;; inherit the current input method
    (call-raco-doc text)))
(global-set-key (kbd "C-c d") 'raco-doc)
(global-set-key (kbd "C-c C-d") 'raco-doc-prompt)
