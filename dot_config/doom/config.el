;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Identity
(setq user-full-name  "Eren Kaplan"
      user-mail-address "erenkaplansec@gmail.com")

;;; Appearance
(setq doom-font          (font-spec :family "SF Mono" :size 13)
      doom-variable-pitch-font (font-spec :family "SF Pro Text" :size 13)
      doom-theme         'doom-tokyo-night
      display-line-numbers-type 'relative)

;;; Org directories
(setq org-directory "~/notes/org/")


;;; Org-mode
(after! org
  ;; Agenda files
  (setq org-agenda-files
        '("~/notes/org/inbox.org"
          "~/notes/org/agenda.org"
          "~/notes/org/projects.org"))

  ;; Todo keywords
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  (setq org-todo-keyword-faces
        '(("TODO"      . (:foreground "#e0e0e0" :weight bold))
          ("NEXT"      . (:foreground "#7a90b8" :weight bold))
          ("WAITING"   . (:foreground "#b8a87a" :weight bold))
          ("DONE"      . (:foreground "#505050" :weight bold))
          ("CANCELLED" . (:foreground "#3a3a3a" :weight bold))))

  ;; Capture templates
  (setq org-capture-templates
        '(("i" "Inbox" entry
           (file "~/notes/org/inbox.org")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n")

          ("n" "Note" entry
           (file+headline "~/notes/org/notes.org" "Notes")
           "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n")

          ("j" "Journal" entry
           (file+olp+datetree "~/notes/org/journal.org")
           "* %?\n%U\n")

          ("a" "Agenda" entry
           (file+headline "~/notes/org/agenda.org" "Tasks")
           "* TODO %?\nSCHEDULED: %^t\n")))

  ;; Refile targets
  (setq org-refile-targets
        '(("~/notes/org/agenda.org"   :maxlevel . 2)
          ("~/notes/org/projects.org" :maxlevel . 2)
          ("~/notes/org/notes.org"    :maxlevel . 1)))

  ;; Appearance
  (setq org-hide-leading-stars     t
        org-ellipsis               " ▾"
        org-startup-indented       t
        org-startup-folded         'content
        org-pretty-entities        t
        org-hide-emphasis-markers  t)

  ;; Deadline / scheduling
  (setq org-deadline-warning-days    7
        org-agenda-span              'week
        org-agenda-start-on-weekday  1) ; Monday

  ;; Archive
  (setq org-archive-location "~/notes/org/archive.org::* Archive"))

;; (setq org-roam-directory (file-truename "~/notes/roam/"))
;; (setq org-roam-file-extensions '("org"))
;; (org-roam-db-autosync-mode)

;;; Keymaps
(map! :leader
      ;; Org capture
      :desc "Org capture"      "X"   #'org-capture

      (:prefix ("o" . "org")
       :desc "Agenda"          "a"   #'org-agenda
       :desc "Capture"         "c"   #'org-capture
       :desc "Inbox"           "i"   (cmd! (find-file "~/notes/org/inbox.org"))
       :desc "Notes"           "n"   (cmd! (find-file "~/notes/org/notes.org"))
       :desc "Journal"         "j"   (cmd! (find-file "~/notes/org/journal.org"))
       :desc "Projects"        "p"   (cmd! (find-file "~/notes/org/projects.org"))))
