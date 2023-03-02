-- open terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.cursorline = false
        vim.cmd "startinsert"
    end,
    group = vim.api.nvim_create_augroup("Terminal", {
        clear = true
    })
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function ()
        vim.highlight.on_yank {
            higroup = "Visual",
            timeout = 150,
            on_visual = false
        }
    end,
    group = vim.api.nvim_create_augroup("YankHighlight", {
        clear = true
    })
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.yuck",
    callback = function ()
        vim.bo.filetype = "clojure"
    end,
    group = vim.api.nvim_create_augroup("YuckFT", {
        clear = true
    })
})
