-- local keymap_restore = {}

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
            require 'user.util.dap.adapters'
            require 'user.util.dap.configurations'

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

                -- save previous 'K' mapping
                -- for _, buf in pairs(vim.api.nvim_list_bufs()) do
                --     local keymaps = vim.api.nvim_buf_get_keymap(buf, 'n')
                --     for _, keymap in pairs(keymaps) do
                --         if keymap.lhs == "K" then
                --             table.insert(keymap_restore, keymap)
                --             vim.keymap.del('n', 'K', { buffer = buf })
                --         end
                --     end
                -- end

                -- map({ 'n', 'v' }, 'K', dapui.eval, opts)
                map({ 'n', 'v' }, 'ge', dapui.eval, opts)
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
                map('n', '<Leader>dd', function()
                    dapui.toggle(1)
                    dapui.toggle(2)
                end, opts)
                map('n', '<Leader>dr', function()
                    dapui.toggle(4)
                end, opts)
                map('n', '<Leader>dR', function() -- temporary mapping
                    dapui.toggle(5)
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
                map('n', '<Leader>dS', function()
                    dapui.float_element('scopes', { enter = true })
                end, opts)
            end

            dap.listeners.before['disconnect']['me'] = function()
                require 'dapui'.close()

                -- return 'K' to it's original mapping
                -- for _, keymap in pairs(keymap_restore) do
                --     vim.keymap.set(
                --         keymap.mode,
                --         keymap.lhs,
                --         keymap.rhs,
                --         {
                --             buffer = keymap.buffer,
                --             silent = keymap.silent == true
                --
                --         }
                --     )
                -- end
                -- keymap_restore = {}

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
                unmap('n', '<Leader>dr')
                unmap('n', '<Leader>dR')
                unmap('n', '<Leader>dc')
                unmap('n', '<Leader>dw')
                unmap('n', '<Leader>ds')
                unmap('n', '<Leader>dS')
                unmap('n', 'ge')
                unmap('v', 'ge')
            end
        end

    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        opts = {
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
                },
                {
                    elements = {
                        'repl'
                    },
                    size = 0.5,
                    position = 'bottom'
                },
                {
                    elements = {
                        'scopes'
                    },
                    size = 0.25,
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
        lazy = true,
        config = true
    },
    {
        'LiadOz/nvim-dap-repl-highlights',
        lazy = true,
        config = true
    }
}
