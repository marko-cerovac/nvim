-- open terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.cmd 'startinsert'
    end,
    group = vim.api.nvim_create_augroup('Terminal', {
        clear = true
    })
})

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank {
            higroup = 'Visual',
            timeout = 150,
            on_visual = false
        }
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', {
        clear = true
    })
})

-- resize splits if window gets resized
vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
        vim.cmd 'tabdo wincmd ='
    end,
    group = vim.api.nvim_create_augroup('ReadjustWindows', {
        clear = true
    })
})

-- rust utilities
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rust',
    callback = function (ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf }

        -- run tests
        map('n', '<Leader>rt', function ()
            -- vim.cmd.vsplit()
            vim.cmd.terminal()
            vim.api.nvim_chan_send(vim.bo.channel, "cargo nextest run\n")
        end, opts)

        vim.api.nvim_buf_create_user_command( ev.buf,
            'Bacon',
            function ()
                vim.cmd.split()
                vim.cmd.terminal()
                vim.api.nvim_chan_send(vim.bo.channel, "bacon\n")
            end,
            { nargs = 0 }
        )

        vim.api.nvim_buf_create_user_command( ev.buf,
            'BaconTest',
            function ()
                vim.cmd.split()
                vim.cmd.terminal()
                vim.api.nvim_chan_send(vim.bo.channel, "bacon test\n")
            end,
            { nargs = 0 }
        )
    end
})
