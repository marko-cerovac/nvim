local M = {}

local function clean_up(buf, win)
    vim.api.nvim_win_close(win, { force = true })
    vim.api.nvim_buf_delete(buf, { force = true })
end

local function execute_rename(buf, win)
    local new_name = vim.trim(vim.fn.getline('.'))
    vim.cmd 'stopinsert'
    clean_up(buf, win)
    vim.lsp.buf.rename(new_name)
end

M.rename = function ()
    local win_config = {
        relative = 'cursor',
        width = 30,
        height = 1,
        col = 0,
        row = 1,
        style = 'minimal',
        title = 'Rename',
    }

    local current_name = vim.fn.expand('<cword>')
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, win_config)
    vim.api.nvim_paste(current_name, false, -1)

    vim.keymap.set('n', '<Esc>', function() clean_up(buf, win) end, { buffer = buf })
    vim.keymap.set('n', 'q', function() clean_up(buf, win) end, { buffer = buf })
    vim.keymap.set('i', '<CR>', function() execute_rename(buf, win) end, { buffer = buf })

    vim.cmd 'startinsert!'

    return win, buf
end

return M
