local telescope = require('telescope')
local actions = require ('telescope.actions')


telescope.setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		-- path_display = {"tail", "absolute"},
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
		mappings = {
			n = {
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,
			},
			i = {
				["<Tab>"] = actions.move_selection_previous,
				["<S-Tab>"] = actions.move_selection_next,
			}
		},
	},
}

local neovim_rc = function ()
    require("telescope.builtin").find_files({
        prompt_title = "NeoVimRC",
        cwd = "~/.config/nvim/",
    })
end

-- Load mappings
require('which-key').register({
	f = {
		name = 'find',
		a = {'<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', 'code actions'},
		b = {'<cmd>lua require("telescope.builtin").buffers()<CR>', 'buffers'},
		c = {'<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', 'in current buffer'},
		e = {'<cmd>lua require("telescope.builtin").file_browser({hidden=true})<CR>', 'file explorer'},
		f = {'<cmd>lua require("telescope.builtin").find_files()<CR>', 'files'},
		g = {'<cmd>lua require("telescope.builtin").live_grep()<CR>', 'grep files'},
		h = {'<cmd>lua require("telescope.builtin").help_tags()<CR>', 'help'},
		o = {'<cmd>lua require("telescope.builtin").vim_options()<CR>', 'options'},
		m = {'<cmd>lua require("telescope.builtin").man_pages()<CR>', 'manual pages'},
		r = {'<cmd>lua require("telescope.builtin").oldfiles()<CR>', 'recent files'},
		s = {'<cmd>lua require("plugins.telescope").neovim_rc()<CR>', 'neovim settings'},
		t = {'<cmd>lua require("telescope.builtin").colorscheme()<CR>', 'colorschemes'},
	},
}, { prefix = '<leader>' })

require('which-key').register({
	g = {
		name = 'git',
		b = {'<cmd>lua require("telescope.builtin").git_branches()<CR>', 'branches'},
		c = {'<cmd>lua require("telescope.builtin").git_commits()<CR>', 'commits'},
		f = {'<cmd>lua require("telescope.builtin").git_files()<CR>', 'files'},
		i = {'<cmd>lua require("telescope.builtin").git_status()<CR>', 'status'},
	},
}, { prefix = '<leader>' })

return { neovim_rc = neovim_rc }
