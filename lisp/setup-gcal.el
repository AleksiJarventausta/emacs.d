(require 'org-caldav)
;;(setq org-caldav-url "https://nextcloud03.webo.hosting/remote.php/da
;;v/calendars/aksu.j@hotmail.com")

(setq org-caldav-url "https://nextcloud03.webo.hosting/remote.php/dav")
(setq org-caldav-calendars
      '((:calendar-id "calendars/aksu.j@hotmail.com/testikalenteri"
                      :files ( "~/org/orgmode_demo.org")
                      :inbox ( "~personal"))))
