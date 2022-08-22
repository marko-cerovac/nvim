local status_ok, material = pcall(require, "material")
if not status_ok then
	vim.notify "Module material not found"
	return
end

local map = vim.keymap.set
local opts = { silent = true }

-- Set the theme style
vim.g.material_style = "deep ocean"

material.setup({
	contrast = {
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

-- Toggle light/dark background
map("n", "[t", function ()
	if vim.g.material_style == "deep ocean" then
		vim.g.material_style = "lighter"
	else
		vim.g.material_style = "deep ocean"
	end
	vim.cmd "colorscheme material"
end, opts)

-- Enable style toggling
map( "n", "]t", function () return require("material.functions").toggle_style() end, opts)

-- Enable the colorscheme
vim.cmd "colorscheme material"
