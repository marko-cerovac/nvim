return {
    {
        'marko-cerovac/material.nvim',
        config = function()
            local material = require 'material'

            vim.g.material_style = 'deep ocean'

            material.setup {
                contrast = {
                    cursor_line = true,
                },
                disable = {
                    eob_lines = true,
                    -- borders = true,
                },
                styles = {
                    comments = { italic = true },
                    functions = { italic = true },
                },
                plugins = {
                    'flash',
                    'telescope',
                    'nvim-cmp',
                    'nvim-web-devicons',
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
            vim.cmd 'colorscheme material'
        end
    }
}
