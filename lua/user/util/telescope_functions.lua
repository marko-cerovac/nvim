local builtin = require "telescope.builtin"

local M = {}

-- NeoVim settings
M.neovim_settings = function()
    builtin.find_files {
        prompt_title = "NeoVim Settings",
        cwd = vim.fn.stdpath "config" .. "/lua/user",
    }
end

return M
