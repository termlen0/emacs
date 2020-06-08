(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c m") 'org-pomodoro) ; start pomo timer



;; ;; hooks for pomodoro org mode
(defun popup_alert (title message)
  (require 'alert)
  (setq alert-default-style 'libnotify)
  (setq alert-fade-time '10)
  (setq alert-persist-idle-time '120)
  (alert (format "\"%s\" : \"%s\"" message title)))

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (popup_alert "Pomodoro completed!" "Time for a break.")))

(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (popup_alert "Pomodoro short break finished" "Ready for another?")))

(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (popup_alert "pomodoro long break finished" "ready for another?")))

(add-hook 'org-pomodoro-killed-hook
          (lambda ()
            (popup_alert "pomodoro killed" "one does not simply kill a pomodoro!")))



;; enable folding for xml
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)

(setq projectile-project-search-path '("~/Projects/"))

(add-hook 'yaml-mode-hook 'indent-guide-mode)
(add-hook 'python-mode-hook 'indent-guide-mode)
