return {
    {
        'OXY2DEV/markview.nvim',
        priority = 1100,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        cmd = 'Markview',
        -- ft = {
        --     'markdown',
        --     'typst',
        --     'yaml',
        --     'tex',
        --     'html',
        -- },
        init = function()
            vim.cmd 'cabbrev mdv Markview'
        end,
        opts = {},
    },
}
