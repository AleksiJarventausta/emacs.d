(require 'org)
(require 'helm)

;; keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o") (lambda() (interactive) (helm-find-files-1 "~/org/")))

(setq org-log-done t)
(setq org-agenda-files (list "~/raspberry/tasks.org"
                             "~/raspberry/appointments.org"))

;; Capture templates
(defvar org-capture-templates)
(setq org-capture-templates
      '(("t" "Todo" entry (file "~/raspberry/tasks.org")
         "* TODO %?\n %T ")
        ("a" "Appointment" entry (file+datetree "~/raspberry/appointments.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

;; ORG STYLING
;; Bullets
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Hide markers, such as *BOLD*
(setq org-hide-emphasis-markers t)

;; Font Family
(let* ((variable-tuple
       (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
             ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
             ((x-list-fonts "Verdana")         '(:font "Verdana"))
             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
      (base-font-color     (face-foreground 'default nil 'default))
      (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;; Headline Font Sizes
(custom-theme-set-faces
 'user
 ;;`(org-todo-keyword-faces ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))
 `(org-level-8 ((t (,@headline ,@variable-tuple))))
 `(org-level-7 ((t (,@headline ,@variable-tuple))))
 `(org-level-6 ((t (,@headline ,@variable-tuple))))
 `(org-level-5 ((t (,@headline ,@variable-tuple))))
 `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
 `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
 `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
 `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
 `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(provide 'setup-org)
