---@diagnostic disable: undefined-field
return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<Leader>dd', function() return require 'dap'.continue() end },
            { '<Leader>b',  function() return require 'dap'.toggle_breakpoint() end },
            { '<M-;>',      function() return require 'dap'.toggle_breakpoint() end },
            { '<Leader>db', function()
                local condition = vim.fn.input({ prompt = 'Breakpoint condition: ' })
                return require 'dap'.toggle_breakpoint(condition)
            end },
            { '<Leader>dx', function() return require 'dap'.clear_breakpoints() end },
        },
        dependencies = {
            'theHamsta/nvim-dap-virtual-text',
            'igorlfs/nvim-dap-view',
        },
        config = function()
            local dap = require 'dap'
            local map = vim.keymap.set
            local unmap = vim.keymap.del

            local cleanup = function()
                map('n', '<Leader>dd', dap.continue)

                unmap({ 'n', 'v' }, 'ge')
                unmap({ 'n', 'v' }, 'gw')
                unmap('n', '<Up>')
                unmap('n', '<Down>')
                unmap('n', '<Left>')
                unmap('n', '<Right>')
                unmap('n', 'C')
                unmap('n', 'H')
                unmap('n', 'J')
                unmap('n', 'L')
                unmap('n', '<Leader>dq')
                unmap('n', '<Leader>ds')
                unmap('n', '<Leader>dr')

                require('dap-view').close(true)
                vim.cmd 'DapVirtualTextDisable'
            end

            -- load adapters and configurations
            require 'user.dap.adapters'
            require 'user.dap.configurations'

            vim.fn.sign_define(
                'DapBreakpoint',
                { text = '', texthl = 'DapBreakpoint', numhl = '' }
            )
            vim.fn.sign_define(
                'DapBreakpointCondition',
                { text = '', texthl = 'DapBreakpoint', numhl = '' }
            )
            vim.fn.sign_define(
                'DapLogPoint',
                { text = '', texthl = 'DapBreakpoint', numhl = '' }
            )
            vim.fn.sign_define(
                'DapStopped',
                { text = '', texthl = 'DapStopped', numhl = '', linehl = 'Visual' }
            )

            dap.listeners.after['event_initialized']['user'] = function()

                map({'n', 'v'}, 'ge', require('dap.ui.widgets').hover)
                map('n', 'C', dap.continue, { desc = 'Continue' })
                map('n', 'H', dap.step_out, { desc = 'Step out' })
                map('n', 'J', dap.step_over, { desc = 'Step over' })
                map('n', 'L', dap.step_into, { desc = 'Step into' })
                map('n', '<Up>', dap.continue, { desc = 'Continue' })
                map('n', '<Left>', dap.step_out, { desc = 'Step out' })
                map('n', '<Down>', dap.step_over, { desc = 'Step over' })
                map('n', '<Right>', dap.step_into, { desc = 'Step into' })
                map('n', '<Leader>dd', require('dap-view').toggle, { desc = 'Toggle UI' })
                map({'n', 'v'}, 'gw', require('dap-view').add_expr, { desc = 'Watch expression' })

                map('n', '<Leader>dq', function()
                    dap.repl.close()
                    dap.terminate({ all = true })
                end, { desc = 'Terminate session' })

                map('n', '<Leader>ds', function()
                    local widgets = require('dap.ui.widgets')
                    widgets.sidebar(widgets.scopes).open()
                end, { desc = 'Show locals' })

                map('n', '<Leader>dr', function()
                    dap.repl.toggle()
                end, { desc = 'Toggle repl' })
            end

            dap.listeners.before['disconnect']['user'] = cleanup
            dap.listeners.before['event_terminated']['user'] = cleanup
            dap.listeners.before['event_exited']['user'] = cleanup
        end
    },
    {
        'igorlfs/nvim-dap-view',
        lazy = true,
        opts = {}
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        lazy = true,
        opts = {
            commented = false,
            all_references = true
        }
    },
}
