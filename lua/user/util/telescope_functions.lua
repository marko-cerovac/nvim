local builtin = require "telescope.builtin"

local functions = {}

-- NeoVim settings
functions.neovim_settings = function()
    builtin.find_files {
        prompt_title = "NeoVim Settings",
        cwd = vim.fn.stdpath "config" .. "/lua/user",
    }
end

functions.material_styles = function()
    builtin.planets {}
end

return functions
