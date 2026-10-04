;;; config.el -*- lexical-binding: t; -*-

;; ------------------------------------------------------------
;; General
;; ------------------------------------------------------------

(setq user-full-name "Eren Kaplan")

(setq doom-theme 'zenpunk)
(setq display-line-numbers-type 'relative)
(setq confirm-kill-emacs nil)

(setq-default
 tab-width 4
 indent-tabs-mode nil)


;; ------------------------------------------------------------
;; Font
;; ------------------------------------------------------------

(setq doom-font
      (font-spec :family "IBM Plex Mono" :size 14))


;; ------------------------------------------------------------
;; UI
;; ------------------------------------------------------------

(setq doom-modeline-height 24)
(setq fancy-splash-image nil)


;; ------------------------------------------------------------
;; Org
;; ------------------------------------------------------------

(setq org-directory "~/notes/org/")

;; Make sure the note directories exist.
(dolist (dir '("~/notes/org/agenda/"
               "~/notes/org/roam/"
               "~/notes/org/roam/reference/"))
  (make-directory (expand-file-name dir) t))

(after! org
  (setq org-startup-indented t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-log-done 'time

        org-agenda-span 'week
        org-agenda-start-on-weekday 1

        org-agenda-files
        '("~/notes/org/agenda/")

        org-default-notes-file
        "~/notes/org/agenda/inbox.org"

        org-todo-keywords
        '((sequence
           "TODO(t)"
           "NEXT(n)"
           "WAIT(w@)"
           "|"
           "DONE(d!)"
           "CANCELLED(c@)"))))


;; ------------------------------------------------------------
;; Org Capture
;; ------------------------------------------------------------

(after! org
  (setq org-capture-templates
        '(("t" "Task" entry
           (file "~/notes/org/agenda/inbox.org")
           "* TODO %?\n  %U\n")

          ("n" "Quick note" entry
           (file "~/notes/org/agenda/inbox.org")
           "* %?\n  %U\n")

          ("j" "Journal" entry
           (file+datetree "~/notes/org/agenda/journal.org")
           "* %<%H:%M> %?\n")

          ("s" "Someday" entry
           (file "~/notes/org/agenda/someday.org")
           "* TODO %?\n  %U\n"))))


;; ------------------------------------------------------------
;; Org-roam
;; ------------------------------------------------------------

(after! org-roam
  (setq org-roam-directory
        (file-truename "~/notes/org/roam/"))

  ;; Keep the database out of the notes directory.
  ;; The generated database does not need to be synced/backed up.
  (setq org-roam-db-location
        (expand-file-name "org-roam.db" doom-cache-dir))

  (setq org-roam-capture-templates
        '(("d" "Default" plain
           "%?"
           :target
           (file+head
            "%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n#+date: %U\n\n")
           :unnarrowed t)

          ("r" "Reference" plain
           "* Source\n%?\n\n* Notes\n"
           :target
           (file+head
            "reference/%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n#+date: %U\n#+filetags: :reference:\n\n")
           :unnarrowed t)))

  (org-roam-db-autosync-mode 1))


;; ------------------------------------------------------------
;; Eglot / LSP
;; ------------------------------------------------------------

(after! eglot
  (setq eglot-autoshutdown t))


;; ------------------------------------------------------------
;; RSS
;; ------------------------------------------------------------

(after! elfeed-org
  (setq rmh-elfeed-org-files
        (list (expand-file-name "elfeed.org" org-directory))))


;; ------------------------------------------------------------
;; Hugo
;; ------------------------------------------------------------

(use-package! easy-hugo
  :commands (easy-hugo easy-hugo-menu)
  :init
  (setq easy-hugo-no-help t
        easy-hugo-previewtime "300")
  :config
  (easy-hugo-enable-menu))

(map! :leader
      (:prefix ("o h" . "hugo")
       :desc "Easy Hugo" "h" #'easy-hugo
       :desc "Hugo menu" "m" #'easy-hugo-menu))


;; ------------------------------------------------------------
;; Magit
;; ------------------------------------------------------------

(map! :leader
      :desc "Magit status"
      "g g" #'magit-status)
