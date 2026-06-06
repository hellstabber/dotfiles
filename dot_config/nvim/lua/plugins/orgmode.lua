return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft    = { "org" },
        config = function()
            require("orgmode").setup({
                org_agenda_files       = "~/notes/org/**/*",
                org_default_notes_file = "~/notes/org/inbox.org",
                org_hide_leading_stars = true,
                org_ellipsis           = " ▾",
            })
        end,
    },
 
    -- Org bullets
    {
        "akinsho/org-bullets.nvim",
        ft   = "org",
        opts = {
            symbols = {
                headlines = { "◉", "○", "✸", "✿" },
            },
        },
    },
}
 

