local dapui = require "dapui"

local map = vim.keymap.set
local opts = { silent = true }

dapui.setup({
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = { "d", "x" },
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = true,
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				-- "repl",
				"console",
			},
			size = 0.24,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = vim.g.border_style,
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	}
})

map("n", "ge", dapui.eval, opts)
map("n", "<Leader>dd", dapui.toggle, opts)
map("n", "<Leader>dc", function() dapui.float_element("console", { enter = true }) end, opts)
map("n", "<Leader>dr", function() dapui.float_element("repl", { enter = true }) end, opts)
map("n", "<Leader>dw", function() dapui.float_element("watches", { enter = true }) end, opts)
