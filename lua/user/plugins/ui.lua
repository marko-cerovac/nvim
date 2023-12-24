return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } } },
                lualine_c = { { 'diagnostics',
                    sources = { 'nvim_lsp' },
                    symbols = {
                        error = ' ',
                        warn = ' ',
                        info = ' ',
                        hint = ' ',
                    },
                    always_visible = true }
                },
                lualine_x = { 'filename', 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress', 'searchcount', 'selectioncount' },
                lualine_z = { 'location' },
            }
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        -- event = {
        --     'BufReadPre',
        --     'BufNewFile',
        -- },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = {
                        hl = 'GitSignsAdd',
                        text = '▎',
                        linehl = 'GitSignsAddLn'
                    },
                    change = {
                        hl = 'GitSignsChange',
                        text = '▎',
                        linehl = 'GitSignsChangeLn'
                    },
                    delete = {
                        hl = 'GitSignsDelete',
                        text = '_',
                        linehl = 'GitSignsDeleteLn'
                    },
                    topdelete = {
                        hl = 'GitSignsDelete',
                        text = '‾', -- 
                        linehl = 'GitSignsDeleteLn'
                    },
                    changedelete = {
                        hl = 'GitSignsChange',
                        text = '▎',
                        linehl = 'GitSignsChangeLn'
                    },
                    untracked = {
                        hl = 'GitSignsAdd',
                        text = '▎',
                        linehl = 'GitSignsAddLn'
                    },
                },
                preview_config = { border = vim.g.border_style },
                on_attach = function(bufnr)
                    local gs   = package.loaded.gitsigns
                    local map  = vim.keymap.set
                    local opts = { silent = true, buffer = bufnr }

                    map('n', ']g', function()
                        if vim.wo.diff then
                            return ']c'
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[g', function()
                        if vim.wo.diff then
                            return '[c'
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true })

                    map({ 'n', 'v' }, '<Leader>ga', gs.stage_hunk, opts)
                    map({ 'n', 'v' }, '<Leader>gA', gs.stage_buffer, opts)
                    map({ 'n', 'v' }, '<Leader>gu', gs.undo_stage_hunk, opts)
                    map({ 'n', 'v' }, '<Leader>gr', gs.reset_hunk, opts)
                    map({ 'n', 'v' }, '<Leader>gR', gs.reset_buffer, opts)
                    -- map({ 'n', 'v' }, '<Leader>gp', gs.preview_hunk, opts)
                    map({ 'n', 'v' }, '<Leader>gp', gs.preview_hunk_inline, opts)
                    map({ 'n', 'v' }, '<Leader>gl', gs.toggle_current_line_blame, opts)
                    map({ 'n', 'v' }, '<Leader>gd', gs.diffthis, opts)

                    -- text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end,
            }
        end,
    },
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        opts = {
            input = {
                -- default_prompt = 'Input:'
                title_pos = 'center',
                border = vim.g.border_style,
                win_options = {
                    winhighlight = 'Title:FloatBorder'
                }
            },
            select = {
                backend = { 'telescope', 'builtin' },
                telescope = require 'telescope.themes'.get_dropdown {},
                builtin = {
                    border = vim.g.border_style,
                    mappings = {
                        ['q'] = 'Close',
                        ['<Esc>'] = 'Close',
                        ['<CR>'] = 'Confirm',
                    },
                }
            }
        }
    }
    --[[ {
        'folke/noice.nvim',
        event = {
            'CmdLineEnter',
            'InsertEnter',
        },
        dependencies = { 'MunifTanjim/nui.nvim' },
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
                signature = {
                    enabled = false,
                }
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = false,
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = '50%',
                        col = '50%',
                    },
                    border = {
                        style = vim.g.border_style
                    }
                },
                mini = {
                    timeout = 5000,
                    position = {
                        row = '0%',
                        col = '100%',
                    },
                    border = {
                        style = vim.g.border_style
                    }
                }
            }
        }
    }, --]]
}
