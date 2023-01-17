-- neovim config
-- author: Marko Cerovac
-- repo: https://github.com/marko-cerovac/nvim

-- use precompiled cache
local ok = pcall(require, "impatient")
if not ok then
    vim.notify "Module impatient not found"
    vim.notify "Starting without precompiled cache"
    vim.notify "Run :LuaCacheClear to setup precompiled cache"
end

-- vscodium
if vim.g.vscode then
    require "user.util.vscode"
    return
end

-- load user settings
require "user.core.settings"

-- load user keymaps
require "user.core.keymaps"

-- load user autocommands
require "user.core.autocommands"

-- load plugins
require "user.plugins"

-- neovide ui
if vim.g.neovide then
    require "user.util.neovide"
end
