-- open terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.cursorline = false
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
