require("dapui").setup({
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

require('which-key').register({
	d = {
		name = 'debugg',
		d = {'<cmd>lua require("dapui").toggle()<CR>', 'toggle ui'},
		e = {'<cmd>lua require("dapui").eval()<CR>', 'evaluate expression'},
		-- f = {'<cmd>lua require("dapui").float_element()<CR>'},
		-- r = {'<cmd>lua require("dapui").toggle("tray")<CR>', 'toggle repl'}
	},
}, { prefix = '<leader>' })

require('which-key').register({
	f = {
		name = 'floating',
		b = {'<cmd>lua require("dapui").float_element("breakpoints")<CR>', 'breakpoints'},
		c = {'<cmd>lua require("dapui").float_element("console")<CR>', 'console'},
		r = {'<cmd>lua require("dapui").float_element("repl")<CR>', 'repl'},
		s = {'<cmd>lua require("dapui").float_element("scopes", {enter = true})<CR>', 'scopes'},
		t = {'<cmd>lua require("dapui").float_element("stacks")<CR>', 'stacks'},
		w = {'<cmd>lua require("dapui").float_element("watches", {enter = true})<CR>', 'watches'},
	}
}, { prefix = '<leader>d' })
