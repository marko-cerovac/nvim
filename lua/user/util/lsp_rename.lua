local function dorename(win)
    local new_name = vim.trim(vim.fn.getline ".")
    vim.api.nvim_win_close(win, true)
    vim.lsp.buf.rename(new_name)
    vim.cmd "stopinsert"
end

local function rename()
    local opts = {
        relative = "cursor",
        row = 1,
        col = 0,
        width = 30,
        height = 1,
        style = "minimal",
        border = vim.g.border_style,
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.cmd "startinsert"

    vim.keymap.set({ "i", "n" }, "<CR>", function()
        dorename(win)
    end, { silent = true, buffer = buf })

    vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
    end, { silent = true, buffer = buf })

    vim.keymap.set("n", "<Esc>", function()
        vim.api.nvim_win_close(win, true)
    end, { silent = true, buffer = buf })
end

return {
    rename = rename,
}
