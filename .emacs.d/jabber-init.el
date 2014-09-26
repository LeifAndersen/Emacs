(defun jabber ()
  (interactive)
  (jabber-connect)
  (switch-to-buffer "*-jabber-*"))

(setq jabber-account-list
      '(("email@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

