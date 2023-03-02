local dap = require "dap"

-- cppdbg
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            if not vim.g.dap_executable then
                vim.ui.input({
                    prompt = "Path to executable: ",
                    default = vim.fn.getcwd() .. "/",
                    completion = "file",
                }, function(input)
                    vim.g.dap_executable = input
                end)
            end
            return vim.g.dap_executable
        end,
        --[[ args = function ()
            local string = vim.ui.input({
                prompt = "Command line arguments: "
            }, function (input)
                return input
            end)

            local cmd_args = {}
            for substring in string:gmatch("%S+") do
                table.insert(cmd_args, substring)
            end
            return cmd_args
        end, ]]
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
