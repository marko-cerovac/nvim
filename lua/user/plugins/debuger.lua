return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<Leader>dd', function() return require 'dap'.continue() end },
            { '<Leader>b', function() return require 'dap'.toggle_breakpoint() end },
            { '<M-;>', function() return require 'dap'.toggle_breakpoint() end },
            { '<Leader>dx', function() return require 'dap'.clear_breakpoints() end },
        },
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'LiadOz/nvim-dap-repl-highlights',
        },
        config = function()
            local dap = require 'dap'
            local map = vim.keymap.set
            local unmap = vim.keymap.del
            local opts = { silent = true }

            -- load adapters and configurations
            -- require 'user.debugger.adapters'
            -- require 'user.debugger.configurations'

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
                local dapui = require 'dapui'

                -- TODO: map 'K' to dap.eval using restore_keymaps

                map('n', '<Up>', dap.continue, opts)
                map('n', '<Down>', dap.step_over, opts)
                map('n', '<Left>', dap.step_out, opts)
                map('n', '<Right>', dap.step_into, opts)
                map('n', '<Leader>dq', function()
                    dap.repl.close()
                    dap.terminate()
                end, opts)
                map({ 'n', 'v' }, 'ge', dapui.eval, opts)
                map('n', '<Leader>dd', function()
                    dapui.toggle(1)
                    dapui.toggle(2)
                end, opts)
                map('n', '<Leader>dc', function()
                    dapui.float_element('console', { enter = true })
                end, opts)
                map('n', '<M-c>', function()
                    dapui.toggle(3)
                end, opts)
                map('n', '<Leader>dw', function()
                    dapui.float_element('watches', { enter = true })
                end, opts)
                map('n', '<Leader>ds', function()
                    dapui.float_element('stacks', { enter = true })
                end, opts)
            end

            dap.listeners.after['disconnect']['me'] = function()
                require('dapui').close()

                map('n', '<Up>', 'k', opts)
                map('n', '<Down>', 'j', opts)
                map('n', '<Left>', 'h', opts)
                map('n', '<Right>', 'l', opts)
                map('n', '<Leader>dd', dap.continue, opts)
                unmap('n', '<M-c>')
                unmap('n', '<Leader>dq')
                unmap('n', '<Leader>dc')
                unmap('n', '<Leader>dw')
                unmap('n', '<Leader>ds')
                unmap('n', 'ge')
                unmap('v', 'ge')
            end
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        opt = true,
        config = {
            mappings = {
                expand = { '<CR>', '<2-LeftMouse>' },
                open = 'o',
                remove = { 'd', 'x' },
                edit = 'e',
                repl = 'r',
                toggle = 't',
            },
            expand_lines = true,
            layouts = {
                {
                    elements = {
                        'scopes',
                        'breakpoints',
                        'stacks',
                        'watches',
                    },
                    size = 40,
                    position = 'right',
                },
                {
                    elements = {
                        'console',
                        'repl',
                    },
                    size = 0.25,
                    position = 'bottom',
                },
                {
                    elements = {
                        'console',
                    },
                    size = 0.40,
                    position = 'right',
                }
            },
            floating = {
                border = vim.g.border_style,
                mappings = {
                    close = { 'q', '<Esc>' },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil,
            },
        }
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        opt = true,
        config = true
    },
    {
        'LiadOz/nvim-dap-repl-highlights',
        opt = true,
        config = true
    }
}
