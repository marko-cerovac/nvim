local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("Module telescope not found", vim.log.levels.WARN)
	return
end

local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local themes = require "telescope.themes"
local map = vim.keymap.set
local opts = { silent = true }

telescope.setup {
	defaults = themes.get_ivy {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-s>"] = actions.select_horizontal,
			},
			n = {
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,
			}
		},
		prompt_prefix = " ",
		selection_caret = " ",
		multi_icon = "落",
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer"
				},
				n = {
					["d"] = "delete_buffer"
				}
			}
		},
		commands = { theme = "dropdown" },
		lsp_references = { theme = "cursor" },
		lsp_implementations = { theme = "cursor" },
		lsp_definitions = { theme = "cursor" },
		lsp_type_definitions = { theme = "cursor" },
	},
	extensions = {
		["file_browser"] = {
			hijack_netrw = true,
		},
		["ui-select"] = {
			-- themes.get_cursor {}
			themes.get_dropdown {}
		},
	}
}

-- Load extensions
telescope.load_extension "fzy_native"
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"

local neovim_settings = function()
	builtin.find_files({
		prompt_title = "NeoVim Settings",
		cwd = vim.fn.stdpath "config" .. "/lua/user",
	})
end

-- Set keymaps
map("n", "gb", builtin.buffers, opts)
map("n", "gc", builtin.commands, opts)
map("n", "gs", neovim_settings, opts)
map("n", "<Leader>e", telescope.extensions.file_browser.file_browser, opts)
map("n", "<Leader>fg", builtin.live_grep, opts)
map("n", "<Leader>gf", builtin.git_files, opts)
map("n", "<Leader>gc", builtin.git_commits, opts)
map("n", "<Leader>fr", builtin.oldfiles, opts)
map("n", "<Leader>ft", builtin.colorscheme, opts)
