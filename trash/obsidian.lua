return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = true,
        event = {
            'BufReadPre ' .. vim.fn.expand '~' .. '/Vaults/Life/*.md',
            'BufNewFile ' .. vim.fn.expand '~' .. '/Vaults/Life/*.md',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            workspaces = {
                {
                    name = 'personal',
                    path = '~/Vaults/Life',
                },
            },
            daily_notes = {
                folder = 'Journal/Daily'
            },
            templates = {
                folder = 'Templates'
            },
            attachments = {
                img_folder = 'Attachments/Images'
            },
            completion = {
                nvim_cmp = false
            },
            ui = {
                enable = false -- use markview.nvim for rendering
            },
            mappings = {
                ['gf'] = {
                    action = function()
                        return require('obsidian').util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                ['<m-Enter>'] = {
                    action = function()
                        return require('obsidian').util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                ['<c-Space>'] = {
                    action = function()
                        return require('obsidian').util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
                ['<C-o>'] = {
                    action = function()
                        vim.cmd 'ObsidianQuickSwitch'
                    end,
                    opts = { buffer = true }
                },
            },
            picker = {
                name = 'telescope.nvim',
                mappings = {
                    new = '<S-Enter>',
                    insert_link = '<C-l>',
                },
            }
        },
    }
}
