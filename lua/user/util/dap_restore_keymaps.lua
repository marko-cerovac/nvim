local M = {}

M.keymaps = {
    old_keymaps = {},
    new_keymaps = {},
}

--- @param new_keymaps table a table containing paris of keymaps and their new functions
M.save_keymaps = function (new_keymaps)
    for keymap in new_keymaps do
        table.insert(M.keymaps.new_keymaps, keymap)
    end

    for _,buf in pairs(vim.api.nvim_list_bufs()) do -- go through all opened buffers
        local existing_keymaps = vim.api.nvim_buf_get_keymap(buf, 'n')

        for _, buf_keymap in pairs(existing_keymaps) do -- go through all keymaps for the current buffer
            for new_keymap in M.keymaps.new_keymaps do -- match the current keymap against those in M.keymaps.new_keymaps
                if new_keymap[1] == buf_keymap.lhs then
                    table.insert(M.keymaps.old_keymaps, buf_keymap)
                    vim.api.nvim_buf_del_keymap(buf, 'n', buf_keymap.lhs)
                end
            end
        end
    end

    for new_trigger, new_rhs in pairs(M.keymaps.new_keymaps) do
        for old_mapping in M.keymaps.old_keymaps do
            if old_mapping.lhs == new_trigger then
                vim.keymap.set(
                    old_mapping.buffer,
                    old_mapping.mode,
                    new_trigger,
                    new_rhs
                )
            end
        end
    end

end

M.restore_keymaps = function()
    for keymap in M.keymaps.old_keymaps do
        vim.keymap.set(
            keymap.buffer,
            keymap.mode,
            keymap.lhs,
            keymap.rhs,
            { silent = keymap.silent == 1 }
        )
    end

    M.keymaps.old_keymaps = {}
    M.keymaps.new_keymaps = {}
end

return M
