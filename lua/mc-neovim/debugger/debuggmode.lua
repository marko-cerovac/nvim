local libmodal = require("libmodal")

libmodal.Layer.enter({
	n = {
		b = {
			rhs = ":lua require('dap').toggle_breakpoint()<CR>",
			noremap = true
		},
		c = {
			rhs = ":lua require('dap').continue()<CR>",
			noremap = true
		},
		h = {
			rhs = ":lua require('dap').step_out()<CR>",
			noremap = true
		},
		j = {
			rhs = ":lua require('dap').step_over()<CR>",
			noremap = true
		},
		k = {
			rhs = ":lua require('dap').step_back()<CR>",
			noremap = true
		},
		l = {
			rhs = ":lua require('dap').step_into()<CR>",
			noremap = true
		},
		p = {
			rhs = ":lua require('dap').pause()<CR>",
			noremap = true
		},
		q = {
			rhs = ":lua require('dap').quit()<CR>",
			noremap = true
		},
		g = {
			rhs = ":lua require('dap').run_to_cursor()<CR>",
			noremap = true
		},
		d = {
			rhs = ":lua require('dapui').toggle('sidebar')<CR>",
			noremap = true
		},
		e = {
			rhs = ":lua require('dapui').eval()<CR>",
			noremap = true
		},
		r = {
			rhs = ":lua require('dapui').toggle('tray')<CR>",
			noremap = true
		},
	}
})

vim.notify("Entered debugg mode")

-- layer:enter()
