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
    {
        'cbochs/grapple.nvim',
        opts = {
            scope = 'git', -- static | global
        },
        keys = {
            { '<M-m>', function()
                require('grapple').toggle()
                vim.notify('File ' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t') .. ' tagged')
            end },
            { '<M-1>',     function() require('grapple').select({ index = 1 }) end },
            { '<M-2>',     function() require('grapple').select({ index = 2 }) end },
            { '<M-3>',     function() require('grapple').select({ index = 3 }) end },
            { '<M-4>',     function() require('grapple').select({ index = 4 }) end },
            { '<M-]>',     function() require('grapple').cycle_tags('next') end },
            { '<M-[>',     function() require('grapple').cycle_tags('prev') end },
            { '<leader>m', function() require('grapple').toggle_tags() end },
        },
    },
}
