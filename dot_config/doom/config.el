;;; config.el -*- lexical-binding: t; -*-

;; ------------------------------------------------------------
;; General
;; ------------------------------------------------------------

(setq user-full-name "Eren Kaplan")

(setq doom-theme 'doom-one)
(setq display-line-numbers-type 'relative)
(setq confirm-kill-emacs nil)

(setq-default
 tab-width 4
 indent-tabs-mode nil)


;; ------------------------------------------------------------
;; Font
;; ------------------------------------------------------------

(setq doom-font
      (font-spec :family "monospace" :size 14))


;; ------------------------------------------------------------
;; UI
;; ------------------------------------------------------------

(setq doom-modeline-height 24)
(setq fancy-splash-image nil)


;; ------------------------------------------------------------
;; Org
;; ------------------------------------------------------------

(setq org-directory "~/notes/org/")

(after! org
  (setq org-startup-indented t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-log-done 'time

        org-agenda-files
        '("~/notes/org/agenda/")

        org-default-notes-file
        "~/notes/org/agenda/inbox.org"))

;; Capture
(after! org
  (setq org-capture-templates
        '(("t" "Task" entry
           (file "~/notes/org/agenda/inbox.org")
           "* TODO %?\n  %U\n")

          ("n" "Quick note" entry
           (file "~/notes/org/agenda/inbox.org")
           "* %?\n  %U\n")

          ("s" "Someday" entry
           (file "~/notes/org/agenda/someday.org")
           "* TODO %?\n  %U\n"))))

;; ------------------------------------------------------------
;; Org-roam
;; ------------------------------------------------------------

(after! org-roam
  (setq org-roam-directory
        (file-truename "~/notes/org/roam/"))

  (setq org-roam-db-location
        (expand-file-name "org-roam.db"
                          org-roam-directory))

  (org-roam-db-autosync-mode))

(after! org-roam
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :target
           (file+head
            "%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n#+date: %U\n\n")
           :unnarrowed t)

          ("r" "reference" plain
           "* Source\n%?\n\n* Notes\n"
           :target
           (file+head
            "reference/%<%Y%m%d%H%M%S>-${slug}.org"
            "#+title: ${title}\n#+date: %U\n#+filetags: :reference:\n\n")
           :unnarrowed t))))



;; ------------------------------------------------------------
;; LSP
;; ------------------------------------------------------------

(after! lsp-mode
  (setq lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t
        lsp-modeline-code-actions-enable t))


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
