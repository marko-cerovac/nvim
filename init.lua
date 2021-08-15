if vim.g.vscode == nil then

	-- Core
	require('settings')
	require('mappings')

	-- Plugins
	require('plugins')
	require('colorscheme')

	-- UI
	require('ui.neovide')

end
