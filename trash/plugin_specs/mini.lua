return {
    {
        "nvim-mini/mini.pick",
        lazy = false,
        dependencies = {
            "nvim-mini/mini.extra",
            "nvim-mini/mini.icons",
        },
        config = function()
            local pick = require("mini.pick")
            local extra = require("mini.extra")
            local map = vim.keymap.set

            pick.setup({
                window = {
                    config = {
                        relative = 'editor',
                        row = vim.o.lines,
                        width = vim.o.columns,
                    },
                },
            })

            map("n", "<leader>e", function() extra.pickers.explorer() end, { desc = "Find Files" })
            map("n", "<leader>ff", function() pick.builtin.files() end, { desc = "Find Files" })
            map("n", "<leader>fg", function() pick.builtin.grep_live() end, { desc = "Live Grep" })
            map("n", "gb", function() pick.builtin.buffers() end, { desc = "Buffers" })
            map("n", "<leader>fh", function() pick.builtin.help() end, { desc = "Help Tags" })

            map("n", "<leader>gg", function() extra.pickers.git_files() end, { desc = "Git Files" })
            map("n", "<leader>fd", function() extra.pickers.diagnostic() end, { desc = "Diagnostics" })

            -- LSP Symbols (passing arguments to the Lua function)
            map("n", "<leader>fl", function()
                extra.pickers.lsp({ scope = 'symbol' })
            end, { desc = "LSP Symbols" })

            -- 3. Custom Downloads Picker (Fully Lua)
            map("n", "gs", function()
                pick.builtin.files(nil, {
                    source = {
                        name = "NeoVim config",
                        cwd = vim.fn.expand("~/.config/nvim")
                    }
                })
            end, { desc = "Neovim config" })
        end,
    },
    {
        'nvim-mini/mini.notify',
        opts = {
            content = {
                format = function(notif)
                    local icon = ' '

                    if notif.level == 'DEBUG' then
                        icon = ''
                    elseif notif.level == 'ERROR' then
                        icon = ''
                    elseif notif.level == 'INFO' then
                        icon = ''
                    elseif notif.level == 'TRACE' then
                        icon = ''
                    elseif notif.level == 'WARN' then
                        icon = ''
                    end

                    return string.format('%s | %s', icon, notif.msg)
                end
            },
            lsp_progress = {
                enable = true
            },
            window = {
                winblend = 0
            }
        },
        init = function()
            vim.notify = require('mini.notify').make_notify()
        end
    },
    {
        'nvim-mini/mini.ai',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        config = function()
            local ai = require 'mini.ai'
            ai.setup {
                custom_textobjects = {
                    F = ai.gen_spec.treesitter({
                        a = '@function.outer',
                        i = '@function.inner'
                    }),
                    c = ai.gen_spec.treesitter({
                        a = '@class.outer',
                        i = '@class.inner',
                    }),
                    i = ai.gen_spec.treesitter({
                        a = '@conditional.outer',
                        i = '@conditional.inner',
                    }),
                    o = ai.gen_spec.treesitter({
                        a = '@loop.outer',
                        i = '@loop.inner',
                    }),

                    f = ai.gen_spec.function_call(),
                },
            }
        end
    },
    {
        'echasnovski/mini.indentscope',
        cmd = 'ShowIndent',
        config = function()
            require 'mini.indentscope'.setup {
                -- symbol = '╎',
                symbol = '│',
            }
            vim.api.nvim_create_user_command('ShowIndent', function()
                if vim.g.miniindentscope_disable == nil then
                    vim.g.miniindentscope_disable = false
                    return
                end
                vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
            end, {})
        end
    },
    {
        'nvim-mini/mini.sessions',
        keys = {
            { '<leader>ss', function() MiniSessions.select('read') end,   { silent = true } },
            { '<leader>sd', function() MiniSessions.select('delete') end, { silent = true } },
            { '<leader>sw', function()
                local session_name = vim.fn.input({ prompt = 'Session name: ' })
                MiniSessions.write(session_name)
            end, { silent = true }
            },
        },
        config = true
    },
    {
        'nvim-mini/mini.diff',
        event = 'VeryLazy',
        config = function()
            require('mini.diff').setup {
                view = {
                    -- style = vim.go.number and 'number' or 'sign',
                    style = 'sign',
                    signs = { add = '▍', change = '▍', delete = '' },
                },
            }

            ---@diagnostic disable-next-line: undefined-global
            vim.keymap.set('n', '<Leader>gd', MiniDiff.toggle_overlay, { silent = true })
        end,
    }
}
