return {
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { '<leader>o', '<cmd>Oil<CR>' },
        },
        opts = {
            keymaps = {
                ['<leader>o'] = 'actions.close',
                ['<Esc>'] = 'actions.close'
            }
        }
    },
}
