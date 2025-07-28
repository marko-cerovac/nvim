return {
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
