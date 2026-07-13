return {
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { 'go', '<cmd>Oil<CR>' },
        },
        opts = {
            -- columns = {
            --     'icon',
            --     'permissions',
            --     'size',
            --      'mtime',
            -- },
            keymaps = {
                ['go'] = 'actions.close',
                -- ['<Esc>'] = 'actions.close',
                ["gl"] = function()
                    if vim.g.oil_list_long ~= true then
                        vim.g.oil_list_long = true
                        require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
                    else
                        vim.g.oil_list_long = false
                        require('oil').set_columns({ 'icon' })
                    end
                end,
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
