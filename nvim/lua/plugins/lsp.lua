
return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "cssls",
                    "html",
                    "emmet_ls",
                    "ts_ls",
                    "svelte",
                    "gopls",
                    "intelephense",
                },
                automatic_enable = false,
            })

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- Emmet: HTML, CSS, Svelte, React, dan lainnya
            vim.lsp.config("emmet_ls", {
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "css",
                    "javascript",
                    "javascriptreact",
                    "typescriptreact",
                    "svelte",
                    "vue",
                    "sass",
                    "scss",
                    "less",
                },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })

            -- CSS
            vim.lsp.config("cssls", {
                capabilities = capabilities,
            })

            -- HTML
            vim.lsp.config("html", {
                capabilities = capabilities,
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                    },
                },
            })

            -- JavaScript / TypeScript
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            -- Svelte
            vim.lsp.config("svelte", {
                capabilities = capabilities,
            })

            -- Go
            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })

            -- PHP / Laravel
            vim.lsp.config("intelephense", {
                capabilities = capabilities,
            })

            -- Aktifkan seluruh LSP
            vim.lsp.enable({
                "lua_ls",
                "cssls",
                "html",
                "emmet_ls",
                "ts_ls",
                "svelte",
                "gopls",
                "intelephense",
            })

            -- Keymaps
            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "gd",
                vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gD",
                vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gi",
                vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "gr",
                vim.lsp.buf.references, opts)

            vim.keymap.set("n", "<leader>ca",
                vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<F2>",
                vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<C-K>",
                vim.lsp.buf.signature_help, opts)

            vim.keymap.set("n", "<C-p>",
                vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<A-p>",
                vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>E",
                vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>q",
                vim.diagnostic.setloclist, opts)

            vim.keymap.set("n", "<leader>D",
                vim.lsp.buf.type_definition, opts)

            vim.keymap.set("n", "<leader>wa",
                vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wr",
                vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(
                    vim.lsp.buf.list_workspace_folders()
                ))
            end, opts)
        end,
    },
}

