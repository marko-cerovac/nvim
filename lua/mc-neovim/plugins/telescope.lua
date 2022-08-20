local telescope = require("telescope")
local actions = require ("telescope.actions")

telescope.setup{
	defaults = {
		theme = "ivy",
		mappings = {
			n = {
				['s'] = actions.select_horizontal,
				['v'] = actions.select_vertical,
				['t'] = actions.select_tab,
			},
			i = {
				['<Tab>'] = actions.move_selection_previous,
				['<S-Tab>'] = actions.move_selection_next,
			}
		},
		prompt_prefix = " "
	},
}

local neovim_rc = function ()
    require("telescope.builtin").find_files({
        prompt_title = "NeoVimRC",
        cwd = "~/.config/nvim/",
    })
end

-- Load mappings
require("which-key").register({
	f = {
		name = " find",
		-- a = {"<cmd>Telescope lsp_code_actions theme=cursor<CR>", "code actions"},
		b = {"<cmd>Telescope buffers<CR>", "buffers"},
		-- c = {"<cmd>Telescope lsp_references<CR>", "code references"},
		c = {"<cmd>Telescope lsp_document_symbols theme=cursor<CR>", "code outllne"},
		e = {"<cmd>Telescope file_browser<CR>", "file explorer"},
		f = {"<cmd>Telescope find_files theme=ivy<CR>", "files"},
		g = {"<cmd>Telescope live_grep theme=ivy<CR>", "grep files"},
		h = {"<cmd>Telescope help_tags theme=ivy<CR>", "help"},
		o = {"<cmd>Telescope vim_options theme=ivy<CR>", "options"},
		r = {"<cmd>Telescope oldfiles<CR>", "recent files"},
		s = {"<cmd>PackerLoad telescope.nvim<CR><cmd>lua require('mc-neovim.plugins.telescope').neovim_rc()<CR>", "neovim settings"},
		t = {"<cmd>Telescope colorscheme theme=ivy<CR>", "colorschemes"},
	},
}, { prefix = "<leader>" })

require("which-key").register({
	g = {
		name = " git",
		b = {"<cmd>lua require('telescope.builtin').git_branches()<CR>", "branches"},
		c = {"<cmd>lua require('telescope.builtin').git_commits()<CR>", "commits"},
		f = {"<cmd>lua require('telescope.builtin').git_files()<CR>", "files"},
		i = {"<cmd>lua require('telescope.builtin').git_status()<CR>", "status"},
	},
}, { prefix = "<leader>" })

return { neovim_rc = neovim_rc }
