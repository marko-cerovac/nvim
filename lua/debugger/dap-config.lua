local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
	name = 'lldb'
}
-- C, Cpp and Rust debugger
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Define debugg signs
vim.fn.sign_define('DapBreakpoint', {text='ﭦ ', texthl = 'DapBreakpoint', numhl = ''})
vim.fn.sign_define('DapStopped', {text=' ', texthl = 'DapStopped', numhl = ''})

require('which-key').register({
	d = {
		name = 'debugg',
		b = {'<cmd>lua require("dap").toggle_breakpoint()<CR>', 'toggle breakpoint'},
		c = {'<cmd>lua require("dap").continue()<CR>', 'continue'},
		C = {'<cmd>lua require("dap").run_to_cursor()<CR>', 'run to cursor'},
		g = {'<cmd>lua require"dap".session()<CR>', 'get Session'},
		h = {'<cmd>lua require("dap").step_out()<CR>', 'step out'},
		l = {'<cmd>lua require("dap").step_into()<CR>', 'step into'},
		j = {'<cmd>lua require("dap").step_over()<CR>', 'step over'},
		p = {'<cmd>lua require("dap").pause()<CR>', 'pause'},
		-- r = {'<cmd>lua require("dap").repl.toggle()<CR><C-w>l', 'toggle repl'},
		-- i = {'<cmd>lua require("dap.ui.widgets").hover()<CR>', 'hover'},
		q = {'<cmd>lua require("dap").close()<CR>', 'quit'}
		-- p = {'', 'scopes'},
		-- e = {'', 'set exception'}
	},
}, { prefix = '<leader>' })
