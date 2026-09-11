local term_group = vim.api.nvim_create_augroup('user.terminal', {
    clear = true
})
-- open terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd 'startinsert'
    end,
    group = term_group
})
-- Automatically close the terminal window when the process exits
-- vim.api.nvim_create_autocmd('TermClose', {
--   callback = function()
--     vim.cmd 'bdelete!'
--   end,
--   group = term_group
-- })

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.hl_op {
            higroup = 'Visual',
            timeout = 250,
            on_visual = false
        }
    end,
    group = vim.api.nvim_create_augroup('user.yank_highlight', {
        clear = true
    })
})

-- resize splits if window gets resized
vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
        vim.cmd 'tabdo wincmd ='
    end,
    group = vim.api.nvim_create_augroup('user.readjust_windows', {
        clear = true
    })
})
