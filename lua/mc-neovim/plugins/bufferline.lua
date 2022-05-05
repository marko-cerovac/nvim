require("bufferline").setup {
	options = {
		numbars = "buffer_id",
		numbers = function(opts)
			-- return string.format("%s|%s ", opts.id, opts.raise(opts.ordinal))
			return string.format('%s', opts.id)
		end,

		close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

		indicator_icon = '▎',
		-- indicator_icon = "▎ ",
		buffer_close_icon = '',
		-- diagnostics = "nvim_lsp",
		diagnostics = false,

		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = ' '
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and ' ' or (e == "warning" and ' ' or '' )
				s = s .. n .. ' ' .. sym
			end
			return s
		end,

		offsets = {
			{filetype = "NvimTree", text = "File Explorer", text_align =  "center", highlight = "NvimTreeNormal" },
			{filetype = "SidebarNvim", text = "Sidebar", text_align =  "center", highlight = "NvimTreeNormal" },
			{filetype = "packer", text = "Packer" , text_align =  "center", highlight = "NvimTreeNormal" }
		},

		show_close_icon = false,
		show_buffer_close_icons = false,
		separator_style = "thin", -- "slant" | "thick" | "thin" | { "any", "any" },
	}
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
map('n', "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
map('n', "]b", "<cmd>BufferLineCycleNext<CR>", opts)
map('n', "[b", "<cmd>BufferLineCyclePrev<CR>", opts)

require("which-key").register({
	b = {
		name = "buffer",
		l = {"<cmd>BufferLineMoveNext<CR>", "move buffer right"},
		h = {"<cmd>BufferLineMovePrev<CR>", "move buffer left"},
		e = {"<cmd>BufferLineSortByExtension<CR>", "sort by extension"},
		d = {"<cmd>BufferLineSortByDirectory<CR>", "sort by directory"},
		g = {"<cmd>BufferLinePick<CR>", "go to buffer"},
		x = {"<cmd>BufferLinePickClose<CR>", "select to close"},
	},
}, { prefix = "<leader>" })
