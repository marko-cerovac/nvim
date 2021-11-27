require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "x",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.25 },
    },
    size = 40,
    position = "left", -- Can be "left" or "right"
  },
  tray = {
    elements = { "repl" },
    -- elements = {},
    size = 5,
    position = "bottom", -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
	border = "rounded", -- Border style. Can be "single", "double", or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
	  -- expand = { "<CR>", "<2-LeftMouse>" },
    },
  },
  windows = { indent = 1 },
})

require('which-key').register({
	d = {
		name = 'debugg',
		d = {'<cmd>set nocursorline<CR><cmd>lua require("dapui").toggle("sidebar")<CR><cmd>set cursorline<CR>', 'toggle ui'},
		e = {'<cmd>lua require("dapui").eval()<CR>', 'evaluate expression'},
		r = {'<cmd>lua require("dapui").toggle("tray")<CR>', 'toggle repl'}
	},
}, { prefix = '<leader>' })
