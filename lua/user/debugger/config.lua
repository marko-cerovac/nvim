local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify "Module nvim-dap not found"
	return
end

local map = vim.keymap.set
local opts = { silent = true }

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath "data" .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		-- args = function ()
			-- 	local string = vim.fn.input("Program arguments: ")
			-- 	local cmd_args = {}
			-- 	for substring in string:gmatch("%S+") do
			-- 		table.insert(cmd_args, substring)
			-- 	end
			-- 	return cmd_args
		-- end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description =  "enable pretty printing",
				ignoreFailures = false
			},
		},
	}
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", {text="", texthl = "DapBreakpoint", numhl = ""})
vim.fn.sign_define("DapStopped", {text="", texthl = "DapStopped", numhl = "", linehl = "Visual"})

map("n", "<Up>", dap.continue, opts)
map("n", "<Down>", dap.step_over, opts)
map("n", "<Left>", dap.step_out, opts)
map("n", "<Right>", dap.step_into, opts)
map("n", "<Leader>b", dap.toggle_breakpoint, opts)
map("n", "<M-;>", dap.toggle_breakpoint, opts)
map("n", "<Leader>dq", dap.terminate, opts)
map("n", "<Leader>dx", dap.clear_breakpoints, opts)
