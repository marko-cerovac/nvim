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
	},
	disable = {
		-- borders = true,
		eob_lines = true,
	},
	plugins = {
		trouble = false,
		git_gutter = false,
		sidebar_nvim = false,
		lsp_saga = false,
		nvim_navic = false,
		sneak = false,
		hop = false,
		nvim_illuminate = false,
		mini = false
	},
	lualine_style = "stealth"
})

vim.keymap.set('n', "[t",
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
vim.keymap.set( 'n', "]t",
	function ()
		return require('material.functions').toggle_style()
	end,
	{ noremap = true, silent = true }
)

-- Enable the colorscheme
vim.cmd "colorscheme material"
