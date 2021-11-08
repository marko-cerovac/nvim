vim.cmd[[packadd termdebug]]

require('which-key').register({
	d = {
		name = 'debugg',
		a = {':Asm<CR>', 'jump to assembly'},
		b = {':Break<CR>', 'set breakpoint'},
		B = {':Clear<CR>', 'clear breakpoint'},
		c = {':Continue<CR>', 'continue'},
		d = {':Source<CR>', 'jump to source'},
		e = {':Evaluate<CR>', 'evaluate'},
		f = {':Finish<CR>', 'finish'},
		g = {':Gdb<CR>', 'jump to gdb'},
		n = {':Over<CR>', 'step over'},
		o = {':Program<CR>', 'jump to output'},
		r = {':Run<CR>', 'run'},
		s = {':Step<CR>', 'step into'},
		x = {':Stop<CR>', 'stop'},
	},
}, { prefix = '<leader>' })
