return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason.nvim',
            opts = {
                ui = {
                    backdrop = 100,
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = ""
                    }
                }
            }
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('user.lspconfig', { clear = true }),
                callback = function(ev)
                    local opts   = { buffer = ev.buf }
                    local map    = vim.keymap.set
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    -- enable lsp folding if the ls supports it
                    if client and client:supports_method('textDocument/foldingRange') then
                        local win = vim.api.nvim_get_current_win()
                        vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
                    end

                    -- Mappings
                    -- map('n', 'grn', require('user.util.lsp_rename').rename, opts)
                    map('n', 'gd', vim.lsp.buf.definition, opts)
                    map('n', 'gqf', function() vim.lsp.buf.format { async = true } end, opts)
                    map('n', 'gl', vim.diagnostic.open_float, opts)
                    map('n', 'grq', vim.diagnostic.setqflist, opts)

                    vim.api.nvim_buf_create_user_command(ev.buf, 'LspInlayHintToggle', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end,
                        { nargs = 0 }
                    )
                end
            })

            -- ui config
            vim.diagnostic.config {
                -- virtual_text = {
                --     prefix = '',
                -- },
                virtual_lines = {
                    current_line = true
                },
                signs = {
                    text = { ' ', ' ', ' ', ' ' }
                },
                severity_sort = true,
            }

            vim.lsp.config('*', {
                capabilities = require('blink.cmp').get_lsp_capabilities()
            })

            vim.lsp.enable({
                'lua_ls',
                'clangd',
                -- 'jdtls', -- TURN BACK ON LATER
                -- 'sqls',
                'nushell',
                -- 'basedpyright',
                -- 'tinymist',
                -- 'html-lsp',
            })
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        ft = 'rust'
    },
    -- {
    --     'mfussenegger/nvim-jdtls',
    --     dependencies = { 'mfussenegger/nvim-dap' },
    --     ft = 'java'
    -- }
}
