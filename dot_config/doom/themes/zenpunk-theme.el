;;; zenpunk-theme.el --- Zenpunk theme -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'doom-themes)

(def-doom-theme zenpunk
  "Zenpunk dark theme."

  ((bg         '("#0b090d" "#0b090d" "black"))
   (bg-alt     '("#17111d" "#17111d" "black"))

   (base0      '("#0b090d" "#0b090d" "black"))
   (base1      '("#17111d" "#17111d" "black"))
   (base2      '("#2a2030" "#2a2030" "brightblack"))
   (base3      '("#54495a" "#54495a" "brightblack"))
   (base4      '("#7f7187" "#7f7187" "brightblack"))
   (base5      '("#9d90a4" "#9d90a4" "brightwhite"))
   (base6      '("#b89ad0" "#b89ad0" "brightwhite"))
   (base7      '("#e6dfe8" "#e6dfe8" "white"))
   (base8      '("#ffffff" "#ffffff" "white"))

   (fg         '("#e6dfe8" "#e6dfe8" "white"))
   (fg-alt     '("#7f7187" "#7f7187" "brightblack"))

   (purple     '("#8f6aa8" "#8f6aa8" "magenta"))
   (purple-lt  '("#b89ad0" "#b89ad0" "brightmagenta"))
   (amber      '("#c98b5b" "#c98b5b" "yellow"))

   (grey       base4)
   (red        '("#8f2d3c" "#8f2d3c" "red"))
   (orange     amber)
   (green      purple)
   (yellow     amber)
   (blue       purple)
   (dark-blue  base3)
   (magenta    purple-lt)
   (violet     purple-lt)
   (cyan       purple-lt)
   (teal       purple)
   (dark-cyan  purple)

   ;; Doom face categories
   (highlight      purple-lt)
   (vertical-bar   base2)
   (selection      base2)
   (builtin        purple-lt)
   (comments       base4)
   (doc-comments   base5)
   (constants      purple-lt)
   (functions      purple-lt)
   (keywords       amber)
   (methods        purple-lt)
   (operators      purple)
   (type           amber)
   (strings        purple-lt)
   (variables      fg)
   (numbers        amber)
   (region         base2)
   (error          red)
   (warning        amber)
   (success        purple)
   (vc-modified    amber)
   (vc-added       purple)
   (vc-deleted     red))

  (
   ;; General
   (cursor :background purple-lt)
   (fringe :background bg)
   (hl-line :background bg-alt)

   (line-number
    :foreground base3
    :background bg)

   (line-number-current-line
    :foreground purple-lt
    :background bg
    :weight 'bold)

   (region :background base2)

   (vertical-border :foreground base2)

   ;; Modeline
   (mode-line
    :background bg-alt
    :foreground fg)

   (mode-line-inactive
    :background bg
    :foreground base4)

   (doom-modeline-bar :background purple)

   ;; Minibuffer / completion
   (minibuffer-prompt
    :foreground purple-lt
    :weight 'bold)

   (vertico-current
    :background base2
    :foreground fg)

   (corfu-current
    :background base2
    :foreground fg)

   ;; Search
   (isearch
    :background amber
    :foreground bg
    :weight 'bold)

   (lazy-highlight
    :background base2
    :foreground purple-lt)

   ;; Org
   (org-document-title
    :foreground purple-lt
    :weight 'bold
    :height 1.3)

   (org-level-1
    :foreground purple-lt
    :weight 'bold
    :height 1.15)

   (org-level-2
    :foreground amber
    :weight 'bold)

   (org-level-3
    :foreground purple)

   (org-level-4
    :foreground fg)

   (org-level-5
    :foreground base6)

   (org-block
    :background bg-alt)

   (org-block-begin-line
    :background bg-alt
    :foreground base4)

   (org-block-end-line
    :background bg-alt
    :foreground base4)

   (org-code
    :foreground purple-lt)

   (org-verbatim
    :foreground amber)

   (org-date
    :foreground purple)

   (org-link
    :foreground purple-lt
    :underline t)

   (org-todo
    :foreground amber
    :weight 'bold)

   (org-done
    :foreground base4
    :weight 'bold)

   ;; Magit
   (magit-section-heading
    :foreground purple-lt
    :weight 'bold)

   (magit-branch-local
    :foreground purple-lt)

   (magit-branch-remote
    :foreground amber)

   (magit-diff-added
    :foreground purple)

   (magit-diff-removed
    :foreground red)

   ;; Links
   (link
    :foreground purple-lt
    :underline t)))

;;; zenpunk-theme.el ends here
