local dap = require "dap"

-- LLDB
-- dap.adapters.lldb = {
--     type = "executable",
--     command = "/bin/lldb-vscode",
--     name = "lldb"
-- }

-- CPPDBG
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath "data" .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
