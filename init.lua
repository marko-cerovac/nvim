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
	require('ui.vscode')

else

	-- Settings
	require('core.settings')

	-- Mappings
	require('core.mappings')

	-- Plugins
	require('core.plugins')

end
