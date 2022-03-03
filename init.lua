--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     File: init.lua
--      \:\__\        \::/  /      Desc: NeoVim config
--       \/__/         \/__/


if vim.g.vscode then

	-- VSCode ui
	require("mc-neovim.ui.vscode")

	return

end

-- Settings
require("mc-neovim.core.settings")

-- Mappings
require("mc-neovim.core.mappings")

-- Plugins
require("mc-neovim.plugins")
