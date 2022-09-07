local onedarkpro = require "onedarkpro"

onedarkpro.setup({
	-- styles:
	-- onedark, onelight, onedark_vivid, onedark_dark
	theme = "onedark_vivid",
	dark_theme = "onedark_vivid",
	light_theme = "onelight",
	styles = {
	comments = "italic",
	functions = "italic",
	},
	plugins = {
		all = false,
		native_lsp = true,
		packer = true,
		treesitter = true,
		telescope = true,
		nvim_cmp = true,
		nvim_dap = true,
		nvim_dap_ui = true,
		indentline = true,
		gitsigns = true,
	},
	options = {
		bold = true,
		italic = true,
		underline = true,
		undercurl = true,
		cursorline = true,
		transparency = false,
		terminal_colors = true,
		window_unfocused_color = false,
	}
})
