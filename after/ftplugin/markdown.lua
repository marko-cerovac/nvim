--- fix misaligned sepparators for table headers
--- before: |---    |--  |
--- after:  |-------|----|
local fill_separator = function(line_num)
    local target_line = line_num - 1
    local lines = vim.api.nvim_buf_get_lines(0, target_line, target_line + 1, false)

    if #lines == 0 then
        print("Line " .. line_num .. " not found!")
        return
    end

    local original_text = lines[1]
    local modified_text = original_text:gsub(" ", "-")

    vim.api.nvim_buf_set_lines(0, target_line, target_line + 1, false, {modified_text})
end

vim.api.nvim_create_user_command('TableFormat', function(opts)
    local cmd = string.format(
        "%d,%d! tr -s ' ' | column -t -s '|' -o '|'",
        opts.line1,
        opts.line2
    )
    vim.cmd(cmd)

    fill_separator(opts.line1 + 1)
end, { range = true })
