return {
    {
        'folke/tokyonight.nvim',
        lazy = true,
        config = function()
            require('tokyonight').setup {
                style = 'night',
                -- style = 'moon',
                styles = {
                    comments = { italic = true },
                    functions = { italic = true },
                    floats = "normal"
                },

            }

            -- vim.cmd 'colorscheme tokyonight'
        end,
    },
}
