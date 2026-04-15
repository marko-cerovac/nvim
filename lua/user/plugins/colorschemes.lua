return {
    {
        'marko-cerovac/balaena',
        priority = 1000,
        init = function()
            vim.api.nvim_create_autocmd('OptionSet', {
                pattern = 'background',
                callback = function()
                    local bg_val = vim.v.option_new
                    if bg_val == 'dark' then
                        vim.cmd.colorscheme 'balaena'
                    elseif bg_val == 'light' then
                        vim.cmd.colorscheme 'default'
                    end
                end,
                group = vim.api.nvim_create_augroup("user.background_change", {
                    clear = true
                })
            })
        end,
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
        'gbprod/nord.nvim',
        lazy = true,
        config = function()
            require('nord').setup({})
            vim.cmd.colorscheme('nord')
        end,
    },
}
