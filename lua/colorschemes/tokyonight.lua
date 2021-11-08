vim.g.tokyonight_style = 'storm'

vim.g.tokyonight_terminal_colors = true

vim.g.tokyonight_italic_keywords = true

vim.g.tokyonight_italic_functions = true

vim.g.tokyonight_hide_inactive_statusline = true

vim.g.tokyonight_sidebars = {
	'qf',
	'terminal',
	'packer',
	'dapui_scopes',
	'dapui_breakpoints',
	'dapui_watches',
	'dapui_stacks'
}
vim.g.tokyonight_dark_sidebar = true

vim.g.tokyonight_dark_float = true

-- vim.g.tokyonight_lualine_bold = true

require('lualine').setup {
	options = {
		theme = 'tokyonight'
	}
}

vim.cmd 'colorscheme tokyonight'
