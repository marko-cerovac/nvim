local gs = require "gitsigns"

gs.setup {
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    preview_config = {
        -- Options passed to nvim_open_win
        border = vim.g.border_style,
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },

    on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { silent = true, buffer = bufnr }

        map("n", "]g", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[g", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map({ "n", "v" }, "<Leader>ga", gs.stage_hunk, opts)
        map({ "n", "v" }, "<Leader>gr", gs.reset_hunk, opts)
        map({ "n", "v" }, "<Leader>gR", gs.reset_buffer, opts)
        map({ "n", "v" }, "<Leader>gp", gs.preview_hunk, opts)
        map({ "n", "v" }, "<Leader>gl", gs.toggle_current_line_blame, opts)
        map({ "n", "v" }, "<Leader>gd", gs.diffthis, opts)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
}
