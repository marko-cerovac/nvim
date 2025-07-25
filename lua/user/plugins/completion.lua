return {
    {
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = 'make install_jsregexp',
        config = function()
            local ls    = require 'luasnip'
            local types = require 'luasnip.util.types'
            local map   = vim.keymap.set
            local opts  = { silent = true }

            ls.setup {
                history = true,
                updateevents = 'TextChanged,TextChangedI',
                enable_autosnippets = true,

                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { ' Choice', 'TSComment' } },
                        },
                    },
                },
            }

            map({ 'i', 's' }, '<C-c>', function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, opts)

            map({ 'i', 's' }, '<M-l>', function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end)

            map({ 'i', 's' }, '<M-h>', function()
                if ls.expand_or_jumpable(-1) then
                    ls.expand_or_jump(-1)
                end
            end)

            require('luasnip.loaders.from_lua').lazy_load {
                paths = vim.fn.stdpath 'config' .. '/snippets',
            }
        end
    },
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = { 'L3MON4D3/LuaSnip' },
        build = 'cargo build --release',
        opts = {
            cmdline = { enabled = true },
            keymap = {
                preset = 'none',
                ['<M-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<M-c>'] = { 'hide' },
                ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
                ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
                ['<M-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

                -- supertab
                -- ['<Tab>'] = {
                --     function(cmp)
                --         if cmp.snippet_active() then
                --             return cmp.accept()
                --         else
                --             return cmp.select_and_accept()
                --         end
                --     end,
                --     'snippet_forward',
                --     'fallback'
                -- },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            },
            completion = {
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                accept = {
                    auto_brackets = { enabled = false }

                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    }
                },
                -- nvim-cmp style menu
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label" },
                            { "label_description" },
                            { "kind" },
                        },
                        gap = 2,
                        treesitter = { 'lsp' },
                    },
                    documentation = {
                        auto_show = false
                    },
                    scrollbar = false,
                },

                ghost_text = { enabled = true },
            },
            -- snippets = { preset = 'default' }
            snippets = { preset = 'luasnip' },
            signature = { enabled = true }
        }
    }
}
