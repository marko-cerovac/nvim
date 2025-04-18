return {
    {
        'LhKipp/nvim-nu',
        ft = 'nu',
        build = ':TSInstall nu',
        opts = { use_lsp_features = false }
    },
    {
        'luckasRanarison/tree-sitter-hyprlang',
        ft = 'hyprlang',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        'Fymyte/rasi.vim',
        ft = 'rasi',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        'elkowar/yuck.vim',
        ft = 'yuck',
    },
    {
        'cordx56/rustowl',
        ft = 'rust',
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'OXY2DEV/markview.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        ft = 'markdown',
        opts = {},
    },
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
                nvim_cmp = true
            },
            ui = {
                enable = false -- use markview.nvim for rendering
            }
        },
    }
}
