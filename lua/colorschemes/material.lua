-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = {
		sidebars = true,
		floating_windows = false,
		line_numbers = false,
		sign_column = false,
		cursor_line = false,
	},
	italics = {
		comments = false,
		keywords = true,
		functions = true,
		strings = false,
		variables = false
	},
	contrast_windows = {
		"terminal",
		"packer",
		"qf",
		"NvimTree",
	},
	disable = {
		borders = true,
		background = false,
		term_colors = false,
		eob_lines = true
	}
})

-- Enable style toggling
vim.api.nvim_set_keymap('n', '<leader>ss', ':lua require("material.functions").toggle_style()<CR>', { noremap = true, silent = true })

-- Enable the colorscheme
vim.cmd 'colorscheme material'
