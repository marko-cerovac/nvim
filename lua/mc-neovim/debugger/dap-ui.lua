require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "x",
    edit = "e",
    repl = "r",
  },
  tray = {
    size = 5,
  },
  floating = {
	border = "single", -- Border style. Can be "single", "double", or "rounded"
  },
})

require('which-key').register({
	d = {
		name = 'debugg',
		d = {'<cmd>set nocul<CR><cmd>lua require("dapui").toggle("sidebar")<CR><cmd>set cul<CR>', 'toggle ui'},
		e = {'<cmd>lua require("dapui").eval()<CR>', 'evaluate expression'},
		r = {'<cmd>lua require("dapui").toggle("tray")<CR>', 'toggle repl'}
	},
}, { prefix = '<leader>' })
