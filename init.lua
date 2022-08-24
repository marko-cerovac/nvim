-- NeoVim config
-- Author: Marko Cerovac
-- Repo: https://github.com/marko-cerovac/nvim

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
