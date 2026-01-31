local M = {}

local function eval()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local content = table.concat(lines, '\n')
    local func, err = loadstring(content)

    if func then
        local status, result = pcall(func)

        if not status then
            vim.notify(result, vim.log.levels.ERROR, { title = 'REPL Error' })
        end
    elseif err then
        vim.notify(err, vim.log.levels.ERROR, { title = 'Lua Syntax Error' })
    end

end

M.open = function(opts)
    local buf =  vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].filetype = 'lua'
    local close_cmd = opts.close_cmd or 'q'

    local win_options = {
        -- relative = 'editor',
        split = 'below',
        win = -1,
        height = opts.height or 10,
    }

    vim.api.nvim_open_win(buf, true, win_options)

    vim.keymap.set({'n'}, '<CR>', function() eval() end, { silent = true, buffer = buf })
    vim.keymap.set({'n'}, close_cmd, '<cmd>q<CR>', { silent = true, buffer = buf })
end

return M
