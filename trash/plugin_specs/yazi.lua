return {
    {
        "mikavilpas/yazi.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            {
                "<leader>e",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
        },
        opts = {
            floating_window_scaling_factor = 1,
            yazi_floating_window_border = "none",
            -- floating_window_scaling_factor = 0.9,
            -- yazi_floating_window_border = "single",
            yazi_floating_window_winblend = 0,
            keymaps = {
                open_file_in_vertical_split = "<m-v>",
                open_file_in_horizontal_split = "<m-s>",
                open_file_in_tab = "<m-t>",
            }
        },
        init = function()
            -- mark netrw as loaded so it's not loaded at all.
            vim.g.loaded_netrwPlugin = 1
        end,
    }
}
