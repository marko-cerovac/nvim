local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify "Module telescope not found"
	return
end

local actions = telescope.actions
local builtin = telescope.builtin
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

telescope.setup{
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,
				["<C-s>"] = actions.select.horizontal,
			},
			n = {
				["s"] = actions.select.horizontal,
				["v"] = actions.select.horizontal,
				["t"] = actions.select.horizontal,
			}
		},
		prompt_prefix = " "
	},
	pickers = {
		grep_string = { theme = "ivy" },
		live_grep = { theme = "ivy" },
		buffers = { theme = "ivy" },
		commands = { theme = "dropdown" },
		colorscheme = { theme = "ivy" },
		lsp_references = { theme = "cursor" },
		lsp_implementations = { theme = "cursor" },
		lsp_document_symbols = { theme = "ivy" },
		lsp_workspace_symbols = { theme = "ivy" },
		diagnostics = { theme = "ivy" },
		lsp_definitions = { theme = "cursor" },
		lsp_type_definitions = { theme = "cursor" },
		treesitter = { theme = "ivy" }
	},
	extensions = {
		file_browser = {
			-- theme = "ivy",
			hijack_netrw = true,
			--[[ mappings = {
				["i"] = {
				},
				["n"] = {
				},
			}, ]]
		},
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		ui_select = {
			require("telescope.themes").get_dropdown {}
		},
	}
}

-- Load extensions
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

-- Set keymaps
map("n", "gb", builtin.buffers, opts)
map("n", "<leader>e", builtin.find_files, opts)
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>gf", builtin.git_files, opts)
map("n", "<leader>gc", builtin.git_commits, opts)
map("n", "<leader>fr", builtin.oldfiles, opts)
map("n", "<leader>fc", builtin.commands, opts)
map("n", "<leader>ft", builtin.colorscheme, opts)
