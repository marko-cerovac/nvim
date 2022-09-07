-- NeoVim config
-- Author: Marko Cerovac
-- Repo: https://github.com/marko-cerovac/nvim

-- Use precompiled cache
local status_ok = pcall(require, "impatient")
if not status_ok then
	vim.notify "Module impatient not found"
	vim.notify "Starting without precompiled cache"
	vim.notify "Run :LuaCacheClear to setup precompiled cache"
end

-- VSCodium
if vim.g.vscode then
	require("user.util.vscode")
	return
end

-- Load user settings
require "user.core.settings"

-- Load user keymaps
require "user.core.keymaps"

-- Load user autocommands
require "user.core.autocommands"

-- Load plugins
require "user.plugins"

-- Neovide ui
if vim.g.neovide then
	require("user.util.neovide")
end
