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

if not vim.g.vscode then

	-- Core
	require('core.settings')
	require('core.mappings')

	-- Plugins
	require('core.plugins')

	-- UI
	-- require('ui.neovide')

end
