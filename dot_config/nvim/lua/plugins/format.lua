return {
    -- Mason: LSP/formatter/linter package manager
    {
        "mason-org/mason.nvim",
        opts = {},
    },
 
    -- Mason <-> lspconfig bridge
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",       -- Python
                "clangd",        -- C/C++
                "gopls",         -- Go
                "rust_analyzer", -- Rust
                "solargraph",    -- Ruby
                "lua_ls",        -- Lua
            },
            automatic_installation = true,
        },
    },
 
    -- LSP configuration (nvim 0.11+ API)
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
 
            -- Keymaps applied when LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
                    end
                    map("gd",         vim.lsp.buf.definition,    "Go to definition")
                    map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
                    map("gr",         vim.lsp.buf.references,     "References")
                    map("gi",         vim.lsp.buf.implementation, "Go to implementation")
                    map("K",          vim.lsp.buf.hover,          "Hover documentation")
                    map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
                    map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
                    map("<leader>lf", function()
                        vim.lsp.buf.format({ async = true })
                    end, "Format buffer")
                end,
            })
 
            -- nvim 0.11+ API: vim.lsp.config
            vim.lsp.config("*", { capabilities = capabilities })
 
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace   = { checkThirdParty = false },
                        telemetry   = { enable = false },
                    },
                },
            })
 
            -- Enable servers
            vim.lsp.enable({
                "pyright",
                "clangd",
                "gopls",
                "rust_analyzer",
                "solargraph",
                "lua_ls",
            })
 
            vim.diagnostic.config({
                virtual_text     = true,
                signs            = true,
                underline        = true,
                update_in_insert = false,
                severity_sort    = true,
            })
        end,
    },
}
 

