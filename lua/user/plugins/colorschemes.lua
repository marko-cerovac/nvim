return {
    {
        'marko-cerovac/balaena',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'balaena'
        end
    },
    {
        'marko-cerovac/material.nvim',
        lazy = true,
        config = function()
            local material = require 'material'

            vim.g.material_style = 'deep ocean'

            material.setup {
                contrast = {
                    cursor_line = true,
                    sidebars = true,
                    lsp_virtual_text = true,
                },
                disable = {
                    eob_lines = true,
                },
                styles = {
                    comments = { italic = true },
                    functions = { italic = true },
                },
                plugins = {
                    'telescope',
                    'noice',
                    'nvim-cmp',
                    'nvim-web-devicons',
                    'nvim-notify',
                    'gitsigns',
                    'neogit',
                    'neorg',
                    'noice',
                    'dap',
                    'mini',
                },
                lualine_style = 'stealth',
            }

            -- enable the colorscheme
            -- vim.cmd.colorscheme 'material'
        end
    },
    {
        'mcauley-penney/techbase.nvim',
        lazy = true,
        config = function()
            vim.cmd.colorscheme 'techbase'
        end
    },
}
