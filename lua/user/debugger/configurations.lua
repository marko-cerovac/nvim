local dap = require "dap"

-- LLDB
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        program = function()
            if not vim.g.dap_executable then
                vim.g.dap_executable = vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file")
            end
            return vim.g.dap_executable
        end,
        args = {},
        --[[ args = function ()
            local string = vim.fn.input("Program arguments: ")
            local cmd_args = {}
            for substring in string:gmatch("%S+") do
                table.insert(cmd_args, substring)
            end
            return cmd_args
        end, ]]

        -- Before debugging execute:
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        -- After debugging execute
        --    echo 1 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        runInTerminal = true,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- CPPDBG (NOT WORKING CURRENTLY)
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "cppdbg",
--         request = "launch",
--         program = function()
--             if not vim.g.dap_executable then
--                 vim.g.dap_executable = vim.fn.input(
--                     "Path to executable: ",
--                     vim.fn.getcwd() .. "/",
--                     "file")
--             end
--             return vim.g.dap_executable
--         end,
--         --[[ args = function ()
--         	local string = vim.fn.input("Program arguments: ")
--         	local cmd_args = {}
--         	for substring in string:gmatch("%S+") do
--         		table.insert(cmd_args, substring)
--         	end
--         	return cmd_args
--         end, ]]
--         cwd = "${workspaceFolder}",
--         stopOnEntry = true,
--         setupCommands = {
--             {
--                 text = "-enable-pretty-printing",
--                 description = "enable pretty printing",
--                 ignoreFailures = false,
--             },
--         },
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
