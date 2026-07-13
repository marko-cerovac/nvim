local M = {}

local term_buf = nil
-- local term_win = nil

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
        -- border = vim.g.border_style,
    }

    -- open the window and enter it
    local win = vim.api.nvim_open_win(opts.buf, true, win_config)

    return { buf = opts.buf, win = win }
end

M.toggle_floating = function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = create_floating_window { buf = state.floating.buf }

        if vim.bo[state.floating.buf].buftype ~= 'terminal' then
            vim.cmd.term()
        end
    end
end

M.toggle = function(split_type)
  -- Determine the command based on split_type
  local split_cmd = (split_type == "v") and "vsplit" or "split"

  -- Check if terminal buffer exists and is valid
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    local term_win = vim.fn.bufwinnr(term_buf)

    if term_win > -1 then
      -- If visible, close the window
      vim.cmd(term_win .. "close")
    else
      -- If not visible, open with the specified split type
      vim.cmd(split_cmd)
      vim.cmd("buffer " .. term_buf)
    end
  else
    -- If terminal doesn't exist, create it with the specified split type
    vim.cmd(split_cmd .. " | terminal ")
    term_buf = vim.api.nvim_get_current_buf()
  end
end

M.toggle_current_buf = function()

  -- If the current buffer is a terminal, switch back to the previous buffer
  if vim.bo.buftype == 'terminal' then
    vim.cmd('buffer #')
  else
    -- If a terminal buffer already exists and is valid, switch to it
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.cmd('buffer ' .. term_buf)
    else
      -- Otherwise, create a new terminal
      vim.cmd('terminal')
      term_buf = vim.api.nvim_get_current_buf()
    end
    -- Enter insert mode automatically when switching to the terminal
    vim.cmd('startinsert')
  end
end

return M
