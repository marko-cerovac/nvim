-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = true,
	borders = false,
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
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_watches",
		"dapui_stacks"
	},
	disable = {
		background = false,
		term_colors = false,
		eob_lines = true
	}
})

-- Enable style toggling
vim.api.nvim_set_keymap('n', '<leader>ss', ':lua require("material.functions").toggle_style()<CR>', { noremap = true, silent = true })

-- Enable the colorscheme
vim.cmd 'colorscheme material'
