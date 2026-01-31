return {
    {
        'jonarrien/telescope-cmdline.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
        keys = {
            { '<S-Enter>', '<cmd>Telescope cmdline<CR>', { desc = 'Open Telescope command line' } },
        },
        config = function()
            require 'telescope'.load_extension 'cmdline'
        end
    },
    {
        'jvgrootveld/telescope-zoxide',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { '<Leader>j', function()
                return require 'telescope'.extensions.zoxide.list()
            end, { desc = 'Find zoxide directories' } }
        },
        config = function()
            require 'telescope'.load_extension 'zoxide'
        end,
    },
}
