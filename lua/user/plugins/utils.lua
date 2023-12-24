local keymap_opts = { silet = true }

return {
    {
        'willothy/flatten.nvim',
        config = true,
        lazy = false,
        priority = 1001,
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        keys = {
            { '<M-m>', function() require 'harpoon':list():append() end, keymap_opts },
            { '<M-M>', function()
                local harpoon = require 'harpoon'
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, keymap_opts },
            { '<M-1>', function() require 'harpoon':list():select(1) end, keymap_opts },
            { '<M-2>', function() require 'harpoon':list():select(2) end, keymap_opts },
            { '<M-3>', function() require 'harpoon':list():select(3) end, keymap_opts },
            { '<M-4>', function() require 'harpoon':list():select(4) end, keymap_opts },
            { '<M-]>', function() require 'harpoon':list():next() end, keymap_opts },
            { '<M-[>', function() require 'harpoon':list():prev() end, keymap_opts },
        },
        config = function ()
           require 'harpoon':setup()
        end
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
    {
        'nvim-neorg/neorg',
        ft = 'norg',
        build = ':Neorg sync-parsers',
        config = function ()
           require 'neorg'.setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.concealer'] = {
                        config = {
                            icon_preset = 'basic',
                            -- icon_preset = 'varied'
                            -- icon_preset = 'diamond'
                            icons = {
                                todo = {
                                    urgent = {
                                        icon = ''
                                    }
                                }

                            }
                        }
                    },
                    ['core.completion'] = {
                        config = {
                            engine = 'nvim-cmp',
                            name = 'neorg',
                        }
                    },
                    ['core.keybinds'] = {
                        config = {
                            hook = function (keybinds)
                                keybinds.map(
                                    'norg',
                                    'n',
                                    keybinds.leader .. 'mc',
                                    "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>"
                                )
                            end
                        }

                    },
                    ['core.dirman'] = {
                        config = {
                            workspaces = {
                                notes = '~/Documents/neorg/notes',
                                school = '~/Documents/neorg/school',
                                system = '~/Documents/neorg/system'
                            },
                            default_workspace = "notes"
                        }
                    },
                    ['core.pivot'] = {},
                    ['core.promo'] = {},
                    ['core.itero'] = {},
                    ['core.looking-glass'] = {},
                    ['core.qol.toc'] = {},
                    ['core.qol.todo_items'] = {},
                }
            }
        end,

    }
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
