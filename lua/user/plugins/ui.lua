return {
    {
        'norcalli/nvim-colorizer.lua',
        cmd = 'ColorizerToggle',
        init = function()
            vim.cmd 'cabbrev ct ColorizerToggle'
        end
    },
    {
        'OXY2DEV/markview.nvim',
        priority = 1100,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        ft = {
            'markdown',
            'typst',
            'yaml',
            'tex',
            'html',
        },
        init = function()
            vim.cmd 'cabbrev mdv Markview'
        end,
        opts = {},
    },
}
