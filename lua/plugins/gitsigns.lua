require('gitsigns').setup {
	keymaps = {
		-- Default keymap options
		noremap = true,

		['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},


		['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
		['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>gl'] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>',
		-- ['n <leader>gL'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
		-- ['n <leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
	},
	current_line_blame_opts = {
		delay = 200,
	},
	preview_config = {
		border = 'rounded',
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
		n = {'<cmd>Neogit<CR>', 'open neogit'},
        l = "line blame",
        -- L = "full line blame",
		p = "preview hunk",
		r = "reset hunk",
		R = "reset buffer",
        s = "stage hunk",
		S = "stage buffer",
		u = "unstage hunk",
    },
}, { prefix = "<leader>" })
