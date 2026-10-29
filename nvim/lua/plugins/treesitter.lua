
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup({})

        -- Parser yang ingin digunakan
        require("nvim-treesitter").install({
            "lua",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "svelte",
            "go",
            "json",
        })

        -- Aktifkan syntax highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "lua",
                "html",
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "svelte",
                "go",
                "json",
            },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}

