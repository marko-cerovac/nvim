return {
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        config = function()
            local map = vim.keymap.set

            map('n', 'gl', vim.diagnostic.open_float)
            map('n', '[c', vim.diagnostic.goto_prev)
            map('n', ']c', vim.diagnostic.goto_next)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),

                callback = function(ev)
                    local opts = { buffer = ev.buffer }

                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    map('n', 'gD', vim.lsp.buf.declaration, opts)
                    map('n', 'K', vim.lsp.buf.hover, opts)
                    map('n', 'gi', vim.lsp.buf.implementation, opts)
                    -- map('n', 'gr', vim.lsp.buf.references, opts)
                    map('n', '<Leader>cs', vim.lsp.buf.signature_help, opts)
                    map('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    map('n', '<Leader>wd', vim.lsp.buf.remove_workspace_folder, opts)
                    map('n', '<Leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    map('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
                    map('n', '<Leader>cr', vim.lsp.buf.rename, opts)
                    map({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
                    map('n', '<Leader>cf', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end
            })

            -- ui config
            vim.diagnostic.config {
                virtual_text = {
                    prefix = '', -- could be '■', '▎', 'x', '●'
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = vim.g.border_style,
                    style = 'minimal',
                },
            }

            -- set borders for :lspinfo window
            local win = require 'lspconfig.ui.windows'
            local _default_opts = win.default_opts
            win.default_opts = function(options)
                local opts = _default_opts(options)
                opts.border = vim.g.border_style
                return opts
            end

            -- Set borders for all lsp floating windows
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
              opts = opts or {}
              opts.border = opts.border or vim.g.border_style
              -- opts.border = opts.border or border
              return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- set lsp signs
            vim.fn.sign_define(
                'DiagnosticSignError',
                { text = ' ', texthl = 'DiagnosticSignError', numhl = '' }
                -- {text = ' ', texthl = 'DiagnosticSignError', numhl = ''}
            )
            vim.fn.sign_define(
                'DiagnosticSignWarn',
                { text = ' ', texthl = 'DiagnosticSignWarn', numhl = '' }
                -- {text = ' ', texthl = 'DiagnosticSignWarn', numhl = ''}
            )
            vim.fn.sign_define(
                'DiagnosticSignHint',
                { text = ' ', texthl = 'DiagnosticSignHint', numhl = '' }
                -- {text = 'ﴞ ', texthl = 'DiagnosticSignHint', numhl = ''}
            )
            vim.fn.sign_define(
                'DiagnosticSignInfo',
                { text = ' ', texthl = 'DiagnosticSignInfo', numhl = '' }
                -- {text = ' ', texthl = 'DiagnosticSignInfo', numhl = ''}
            )
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = {
            'BufReadPost',
            'BufNewFile',
        },
        dependencies = {
            {
                'williamboman/mason.nvim',
                opts = { ui = { border = vim.g.border_style } }
            },
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local mason_lsp = require 'mason-lspconfig'
            local lspconfig = require 'lspconfig'

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            mason_lsp.setup()
            mason_lsp.setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ['rust_analyzer'] = function()
                    lspconfig.rust_analyzer.setup {
                        capabilities = capabilities,
                        settings = {
                            ['rust-analyzer'] = {
                                checkOnSave = {
                                    -- command = 'check'
                                    command = 'clippy'
                                },
                                imports = {
                                    granularity = {
                                        group = 'module',
                                    },
                                    prefix = 'self',
                                },
                                cargo = {
                                    buildScripts = {
                                        enable = true,
                                    },
                                },
                                procMacro = {
                                    enable = false
                                },
                            }
                        }
                    }
                end,
                ['lua_ls'] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    }
                end,
            }
        end
    }
}
