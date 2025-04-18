local opts = { silet = true }

return {
    {
        'willothy/flatten.nvim',
        config = true,
        lazy = false,
        priority = 1001,
    },
    {
        'cbochs/grapple.nvim',
        opts = {
            scope = 'static',
            -- scope = 'global',
            -- scope = 'git',
        },
        -- cmd = 'Grapple',
        keys = {
            { '<M-m>', function()
                require('grapple').toggle()
                vim.notify('File ' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t') .. ' tagged')
            end, opts
            },
            { '<M-1>',     function() require('grapple').select({ index = 1 }) end, opts },
            { '<M-2>',     function() require('grapple').select({ index = 2 }) end, opts },
            { '<M-3>',     function() require('grapple').select({ index = 3 }) end, opts },
            { '<M-4>',     function() require('grapple').select({ index = 4 }) end, opts },
            { '<M-]>',     function() require('grapple').cycle_tags('next') end,    opts },
            { '<M-[>',     function() require('grapple').cycle_tags('prev') end,    opts },
            { '<leader>m', function() require('grapple').toggle_tags() end,         opts },
        },
    },
    {
        'norcalli/nvim-colorizer.lua',
        cmd = 'ColorizerToggle'
    },
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { '<leader>o', '<cmd>Oil<CR>', opts },
        },
        opts = {
            keymaps = {
                ['<leader>o'] = 'actions.close'
            }
        }
    },
    {
        'folke/trouble.nvim',
        opts = {
            auto_jump = true,
            auto_close = true,
            focus = true,
        },
        cmd = 'Trouble',
        keys = {
            { 'gd',         '<cmd>Trouble lsp_definitions<CR>',                          opts },
            { 'gr',         '<cmd>Trouble lsp_references<CR>',                           opts },
            { 'gi',         '<cmd>Trouble lsp_implementations<CR>',                      opts },
            { '<leader>cd', '<cmd>Trouble diagnostics toggle<CR>',                       opts },
            { '<leader>cb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',          opts },
            { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<CR>',               opts },
            { '<leader>cc', '<cmd>Trouble lsp toggle focus=true win.position=right<CR>', opts },
            { ']d', function()
                require('trouble').next('diagnostics', {
                    skip_groups = true,
                    jump = true
                })
            end, opts },
            { '[d', function()
                require('trouble').prev('diagnostics', {
                    skip_groups = true,
                    jump = true
                })
            end, opts },
        },
    }
}
