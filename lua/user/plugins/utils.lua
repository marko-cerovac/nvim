local keymap_opts = { silet = true }

return {
    {
        'ThePrimeagen/harpoon',
        keys = {
            { '<Leader>m', function() return require 'harpoon.mark'.add_file() end, keymap_opts },
            { '<Leader>M', function() return require 'harpoon.ui'.toggle_quick_menu() end, keymap_opts },
            { '<M-1>', function() return require 'harpoon.ui'.nav_file(1) end, keymap_opts },
            { '<M-2>', function() return require 'harpoon.ui'.nav_file(2) end, keymap_opts },
            { '<M-3>', function() return require 'harpoon.ui'.nav_file(3) end, keymap_opts },
            { '<M-4>', function() return require 'harpoon.ui'.nav_file(4) end, keymap_opts },
            { '<M-]>', function() return require 'harpoon.ui'.nav_next() end, keymap_opts },
            { '<M-[>', function() return require 'harpoon.ui'.nav_prev() end, keymap_opts },
        },
        config = true
    },
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        cmd = 'Neogit',
        config = true,
    },
    {
        'norcalli/nvim-colorizer.lua',
        cmd = 'ColorizerToggle'
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    --     },
    -- }
}
