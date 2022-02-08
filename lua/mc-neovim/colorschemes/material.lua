-- Set the theme style
vim.g.material_style = "deep ocean"

require("material").setup({
	contrast = {
		sidebars = true,
		cursor_line = true,
	},
	italics = {
		comments = true,
		functions = true,
	},
	contrast_filetypes = {
		"packer",
		"qf",
	},
	disable = {
		borders = true,
		eob_lines = true
	},
	lualine_style = "stealth"
})

-- Enable style toggling
vim.api.nvim_set_keymap('n', "<leader>ss", ":lua require('material.functions').toggle_style()<CR>", { noremap = true, silent = true })

-- Enable the colorscheme
vim.cmd "colorscheme material"
