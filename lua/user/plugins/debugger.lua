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
            local opts = { silent = true }

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

            dap.listeners.after['event_initialized']['me'] = function()

                map('n', 'C', dap.continue, opts)
                map('n', 'H', dap.step_out, opts)
                map('n', 'J', dap.step_over, opts)
                map('n', 'L', dap.step_into, opts)
                map('n', '<Up>', dap.continue, opts)
                map('n', '<Down>', dap.step_over, opts)
                map('n', '<Left>', dap.step_out, opts)
                map('n', '<Right>', dap.step_into, opts)
                map('n', '<Leader>dq', function()
                    dap.repl.close()
                    dap.terminate()
                end, opts)
            end

            dap.listeners.before['disconnect']['me'] = function()
                require 'dapui'.close({ 1, 2, 3, 4, 5 })

                map('n', '<Leader>dd', dap.continue, opts)
                unmap('n', '<Up>')
                unmap('n', '<Down>')
                unmap('n', '<Left>')
                unmap('n', '<Right>')
                unmap('n', 'C')
                unmap('n', 'H')
                unmap('n', 'J')
                unmap('n', 'L')
                unmap('n', '<M-c>')
                unmap('n', '<Leader>dq')
                unmap('n', 'ge')
                unmap('v', 'ge')
            end
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
