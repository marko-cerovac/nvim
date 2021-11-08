require('bufferline').setup {
	options = {
		numbars = 'buffer_id',
		-- number_style = "superscript",
		numbers = function(opts)
			return string.format('%s|%s ', opts.id, opts.raise(opts.ordinal))
		end,

		close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

		-- indicator_icon = '▎',
		indicator_icon = '▎ ',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',

		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = false,

		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "" )
				s = s .. n .. " " .. sym
			end
			return s
		end,

		offsets = {
			{filetype = "NvimTree", text = "File Explorer", text_align =  "center", highlight = "NvimTreeFolderIcon" },
			{filetype = "packer", text = "Packer" , text_align =  "center", highlight = "NvimTreeFolderIcon" }
		},

		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = 'id', -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'

		highlights = {
            pick = {
				guifg = {attribute='fg', highlight = 'CursorLineNr'}
			},
			close_button_selected = {
				guifg = {attribute='fg', highlight='CursorLineNr'}
			},
		}
	}
}

local map = require('core.functions').map

map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>')
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>')
map('n', ']b', '<cmd>BufferLineCycleNext<CR>')
map('n', '[b', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<leader>bl', '<cmd>BufferLineMoveNext<CR>')
map('n', '<leader>bh', '<cmd>BufferLineMovePrev<CR>')
map('n', '<leader>be', '<cmd>BufferLineSortByExtension<CR>')
map('n', '<leader>bd', '<cmd>BufferLineSortByDirectory<CR>')
map('n', '<leader>bx', '<cmd>BufferLinePickClose<CR>')
map('n', '<leader>bg', '<cmd>BufferLinePick<CR>')
