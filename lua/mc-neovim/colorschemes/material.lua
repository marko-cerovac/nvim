-- Set the theme style
vim.g.material_style = "deep ocean"

local colors = require("material.colors")

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
		-- "terminal",
		-- "dapui_scopes",
		-- "dapui_breakpoints",
		-- "dapui_stacks",
		-- "dapui_watches",
	},
	disable = {
		-- borders = true,
		eob_lines = true,
	},
	custom_highlights = {
		StatusLine = { bg = colors.bg_alt },
		StatusLineNC = { bg = colors.bg_alt },
	-- 	DapUIValue = { link = "NormalContrast" },
	-- 	DapUIVariable = { link = "NormalContrast" },
	-- 	DapUIFrameName = { link = "NormalContrast" },
	},
	lualine_style = "stealth"

})

-- Enable style toggling
vim.keymap.set( 'n', "<leader>ss",
	function ()
		return require('material.functions').toggle_style()
	end,
	{ noremap = true, silent = true }
)

-- Enable the colorscheme
vim.cmd "colorscheme material"
