local M = {}

M.git = function()
    local git_info = vim.b.gitsigns_status_dict

    if not git_info or git_info.head == '' then
        return ''
    end

    local branch = string.format(' 󰘬 %s', git_info.head) or ''
    local added = git_info.added and string.format('%%#GitSignsAdd# +%s ', git_info.added) or ''
    local changed = git_info.changed and string.format('%%#GitSignsChange# ~%s ', git_info.changed) or ''
    local removed = git_info.removed and string.format('%%#GitSignsDelete# -%s ', git_info.removed) or ''

    if git_info.added == 0 then
        added = ''
    end
    if git_info.changed == 0 then
        changed = ''
    end
    if git_info.removed == 0 then
        removed = ''
    end

    return string.format(' %%#Title#%%%s: %s%s%s', branch, added, changed, removed)
end

M.diagnostics = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local status = vim.diagnostic.status(bufnr)

    if #status == 0 then
        return status
    else
        return string.format('  : {%s}', status)
    end
end

return M
