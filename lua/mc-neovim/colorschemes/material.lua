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
		"lspsagaoutline",
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
	-- custom_highlights = {
	-- 	DapUIValue = { link = "NormalContrast" },
	-- 	DapUIVariable = { link = "NormalContrast" },
	-- 	DapUIFrameName = { link = "NormalContrast" },
	-- },
	lualine_style = "stealth"

})

vim.keymap.set('n', "<leader>sb",
	function ()
		if vim.g.material_style == "deep ocean" then
			vim.g.material_style = "lighter"
		else
			vim.g.material_style = "deep ocean"
		end
		vim.cmd "colorscheme material"
	end
)

-- Enable style toggling
vim.keymap.set( 'n', "<leader>ss",
	function ()
		return require('material.functions').toggle_style()
	end,
	{ noremap = true, silent = true }
)

-- Enable the colorscheme
vim.cmd "colorscheme material"
