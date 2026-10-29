return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            delay = 300,

            spec = {
                { "<leader>c", group = "Code" },
                { "<leader>w", group = "Workspace" },
                { "<leader>g", group = "Git" },
                { "<leader>f", group = "Find / Files" },
                { "<leader>d", group = "Diagnostics" },
                { "<leader>t", group = "Terminal / Tools" },
            },

            win = {
                border = "rounded",
                padding = { 1, 2 },
            },

            layout = {
                width = { min = 20, max = 50 },
                spacing = 3,
            },
        },
    },
}
