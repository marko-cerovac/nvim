local M = {}

local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.width or math.floor(vim.o.lines * 0.8)

    -- calculate position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2) - 2

    if not vim.api.nvim_buf_is_valid(opts.buf) then
        -- create a buffer (no file, scratch bufffer)
        opts.buf = vim.api.nvim_create_buf(false, true)
    end

    -- window options
    local win_config = {
        relative = 'editor',
        width = width,
        height = height,
        col = col,
        row = row,
        style = 'minimal',
        title = 'Terminal',
        title_pos = 'center',
        border = vim.g.border_style,
    }

    -- open the window and enter it
    local win = vim.api.nvim_open_win(opts.buf, true, win_config)

    return { buf = opts.buf, win = win }
end

M.toggle = function(shell_cmd)
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = create_floating_window { buf = state.floating.buf }

        if vim.bo[state.floating.buf].buftype ~= 'terminal' then
            vim.cmd.term(shell_cmd)
        end
    end
end

return M
