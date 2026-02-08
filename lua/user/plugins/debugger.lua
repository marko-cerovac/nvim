---@diagnostic disable: undefined-field
return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            "igorlfs/nvim-dap-view",
        },
        keys = {
            { '<Leader>dd', function() return require 'dap'.continue() end },
            { '<Leader>db', function() return require 'dap'.toggle_breakpoint() end },
            { '<Leader>dB', function()
                local condition = vim.fn.input({ prompt = 'Breakpoint condition: ' })
                return require 'dap'.toggle_breakpoint(condition)
            end },
        },
        config = function()
            local dap = require 'dap'
            local mappings = require 'user.util.dap_mappings'

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

            vim.api.nvim_create_user_command('DapCreateMappings', function()
                mappings.create()
            end, {})
            vim.api.nvim_create_user_command('DapDeleteMappings', function()
                mappings.delete()
            end, {})
            vim.api.nvim_create_user_command('DapCleanUp', function()
                vim.cmd 'DapViewClose'
                dap.repl.close()
                dap.terminate({
                    disconnect_args = {
                        terminateDebugee = true
                    },
                    all = true,
                    hierarchy = true
                })
                mappings.delete()
            end, {})

            -- create mappings when a session starts,
            -- and delete them when it ends
            dap.listeners.after.event_initialized['user'] = mappings.create
            dap.listeners.before.disconnect['user'] = mappings.delete
            dap.listeners.before.event_terminated['user'] = mappings.delete
            dap.listeners.before.event_exited['user'] = mappings.delete
        end
    },
    {
        "igorlfs/nvim-dap-view",
        lazy = true,
        opts = {
            winbar = {
                sections = {
                    "console",
                    "watches",
                    "scopes",
                    "exceptions",
                    "breakpoints",
                    "threads",
                    "repl",
                    "sessions",
                },
                default_section = "console",
            },
            windows = { size = 0.3, },
            auto_toggle = true,
        },
    },
}
