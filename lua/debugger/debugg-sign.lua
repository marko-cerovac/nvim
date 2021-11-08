vim.fn.sign_define('DapBreakpoint', {text='ﭦ ', texthl = 'DapBreakpoint', numhl = ''})
vim.fn.sign_define('DapStopped', {text=' ', texthl = 'DapStopped', numhl = ''})

require('which-key').register({
	d = {
		name = 'debugg',
		b = {'<cmd>lua vim.fn.sign_place(0, "dbg", "DapBreakpoint", 0)<CR>', 'mark breakpoint'},
		s = {'<cmd>lua vim.fn.sign_place(0, "dbg", "DapStopped", 0)<CR>', 'mark stopped'},
	}
}, { prefix = '<leader>' })

