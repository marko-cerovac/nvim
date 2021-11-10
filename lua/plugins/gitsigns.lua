require('gitsigns').setup {
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '⎯', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	numhl = false,
	linehl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,

		['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

		['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>gl'] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>',

		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
	},
	watch_index = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
	},
	current_line_blame_formatter_opts = {
		relative_time = false
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		-- border = 'single',
		border = 'rounded',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	use_internal_diff = true,  -- If vim.diff or luajit is present
	yadm = {
		enable = false
	},
}

-- Load whichkey
require('which-key').register({
    g = {
        name = "git",
        b = "branches",
        c = "commits",
        f = "files",
        i = "status",
        l = "line blame",
		p = "preview hunk",
		r = "reset hunk",
		R = "reset buffer",
        s = "stage hunk",
		u = "unstage hunk"
    },
}, { prefix = "<leader>" })
