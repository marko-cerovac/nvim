---@diagnostic disable: undefined-field
local M = {}

M.delete = function()
    pcall(vim.keymap.del, { 'n', 'v' }, 'ge')
    pcall(vim.keymap.del, { 'n', 'v' }, 'gw')

    pcall(vim.keymap.del, 'n', 'K')
    pcall(vim.keymap.del, 'n', 'J')
    pcall(vim.keymap.del, 'n', 'H')
    pcall(vim.keymap.del, 'n', 'L')
    pcall(vim.keymap.del, 'n', '<Up>')
    pcall(vim.keymap.del, 'n', '<Down>')
    pcall(vim.keymap.del, 'n', '<Left>')
    pcall(vim.keymap.del, 'n', '<Right>')

    pcall(vim.keymap.del, 'n', '<Leader>dq')
    pcall(vim.keymap.del, 'n', '<Leader>dx')
    pcall(vim.keymap.del, 'n', '<Leader>dh')
    pcall(vim.keymap.del, 'n', '<Leader>dj')
    pcall(vim.keymap.del, 'n', '<Leader>dv')
    pcall(vim.keymap.del, 'n', '<Leader>dw')
    pcall(vim.keymap.del, 'n', '<Leader>dl')
    pcall(vim.keymap.del, 'n', '<Leader>dr')
    pcall(vim.keymap.del, 'n', '<Leader>de')
    pcall(vim.keymap.del, 'n', '<Leader>dt')
    pcall(vim.keymap.del, 'n', '<Leader>dc')
end

M.create = function()
    local map = vim.keymap.set
    local dap = require 'dap'

    map('n', 'K', dap.continue, { desc = 'Continue' })
    map('n', 'H', dap.step_out, { desc = 'Step out' })
    map('n', 'J', dap.step_over, { desc = 'Step over' })
    map('n', 'L', dap.step_into, { desc = 'Step into' })
    map('n', '<Up>', dap.continue, { desc = 'Continue' })
    map('n', '<Left>', dap.step_out, { desc = 'Step out' })
    map('n', '<Down>', dap.step_over, { desc = 'Step over' })
    map('n', '<Right>', dap.step_into, { desc = 'Step into' })

    map({ 'n', 'v' }, 'ge', require('dap.ui.widgets').hover)
    map('n', '<Leader>dx', dap.clear_breakpoints, { desc = 'Clear breakpoints' })
    map('n', '<Leader>dh', dap.run_to_cursor, { desc = 'Run to cursor' })
    map('n', '<Leader>dj', dap.focus_frame, { desc = 'Jump to frame' })

    map('n', '<Leader>dv', '<cmd>DapViewToggle<CR>', { desc = 'Show locals' })
    map('n', '<Leader>dw', '<cmd>DapViewShow watches<CR>', { desc = 'Show locals' })
    map('n', '<Leader>dl', '<cmd>DapViewShow scopes<CR>', { desc = 'Show locals' })
    map('n', '<Leader>dr', '<cmd>DapViewShow repl<CR>', { desc = 'Show repl' })
    map('n', '<Leader>de', '<cmd>DapViewShow exceptions<CR>', { desc = 'Show frames' })
    map('n', '<Leader>dt', '<cmd>DapViewShow threads<CR>', { desc = 'Show frames' })
    map('n', '<Leader>dc', '<cmd>DapViewShow console<CR>', { desc = 'Show frames' })

    map('n', '<Leader>dq', function()
        vim.cmd 'DapViewClose'
        dap.repl.close()
        dap.terminate({
            disconnect_args = {
                terminateDebugee = true
            },
            all = true,
            hierarchy = true
        })
    end, { desc = 'Terminate session' })
end

return M
