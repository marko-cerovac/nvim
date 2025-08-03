return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        event = 'UIEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzy-native.nvim',
                build = 'make'
            },
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope = require 'telescope'
            local actions   = require 'telescope.actions'
            local themes    = require 'telescope.themes'
            local map       = vim.keymap.set

            local neovim_settings = function()
                require 'telescope.builtin'.find_files {
                    prompt_title = 'NeoVim Settings',
                    cwd = vim.fn.stdpath 'config',
                    -- cwd = vim.fn.stdpath 'config' .. '/lua/user',
                }
            end

            -- REMOVE AS SOON AS POSSIBLE
            -- ------------------------------------------------
            vim.api.nvim_create_autocmd("User", {
                pattern = "TelescopeFindPre",
                callback = function()
                    vim.opt_local.winborder = "none"
                    vim.api.nvim_create_autocmd("WinLeave", {
                        once = true,
                        callback = function()
                            vim.opt_local.winborder = "single"
                        end,
                    })
                end,
                group = vim.api.nvim_create_augroup('user.ugly_telescope_border_workaround', {
                    clear = true
                })
            })
            -- ------------------------------------------------

            telescope.setup {
                defaults = themes.get_ivy {
                    -- defaults = {
                    mappings = {
                        i = {
                            ['<M-j>'] = actions.move_selection_next,
                            ['<M-k>'] = actions.move_selection_previous,
                            ['<C-s>'] = actions.select_horizontal,
                        },
                        n = {
                            ['s'] = actions.select_horizontal,
                            ['v'] = actions.select_vertical,
                            ['t'] = actions.select_tab,
                        },
                    },
                    prompt_prefix = ' ',
                    selection_caret = ' ',
                    multi_icon = '落',
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ['<C-d>'] = 'delete_buffer',
                            },
                            n = {
                                ['d'] = 'delete_buffer',
                            },
                        },
                    },
                    commands = { theme = 'dropdown' },
                    marks = { theme = 'dropdown' },
                    colorscheme = { theme = 'dropdown' },
                    lsp_references = { theme = 'cursor' },
                },
                extensions = {
                    ['file_browser'] = {
                        hijack_netrw = true,
                    },
                    ['ui-select'] = {
                        themes.get_dropdown { initial_mode = 'normal' }
                    },
                    ['cmdline'] = {
                        mappings = {
                            complete      = '<Tab>',
                            run_selection = '<CR>',
                            run_input     = '<C-CR>',
                        }
                    }
                }
            }

            -- load extensions
            telescope.load_extension 'fzy_native'
            telescope.load_extension 'ui-select'

            map('n', 'gs', neovim_settings, { desc = 'Find NeoVim settings' })
            map('n', 'g;', require('telescope.builtin').buffers, { desc = 'Find open buffers' })
            map('n', 'grr', require('telescope.builtin').lsp_references, { desc = 'Find LSP references' })
            map('n', 'gO', require('telescope.builtin').lsp_document_symbols, { desc = 'Show LSP document symbols' })
            map('n', 'gri', require('telescope.builtin').lsp_implementations, { desc = 'Find LSP implementations' })
            map('n', '<Leader>fg', require('telescope.builtin').live_grep, { desc = 'Grep directory' })
            map('n', '<Leader>fr', require('telescope.builtin').oldfiles, { desc = 'Find recent files' })
            map('n', '<Leader>ft', require('telescope.builtin').colorscheme, { desc = 'Find colorschemes' })
            map('n', '<Leader>fh', require('telescope.builtin').help_tags, { desc = 'Find help tags' })
            map('n', '<Leader>fm', require('telescope.builtin').marks, { desc = 'Find marks' })
            map('n', '<Leader>gg', require('telescope.builtin').git_files, { desc = 'Find Git files' })
            map('n', '<Leader>gc', require('telescope.builtin').git_commits, { desc = 'Find Git commits' })
            map('n', '<Leader>gb', require('telescope.builtin').git_branches, { desc = 'Find Git branches' })
        end

    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
            {
                'nvim-tree/nvim-web-devicons',
                config = true
            },
        },
        keys = {
            { '<Leader>e', function()
                return require 'telescope'.extensions.file_browser.file_browser()
            end, { desc = 'Open Telescope file browser' }
            },
        },
        config = function()
            require 'telescope'.load_extension 'file_browser'
        end
    },
    {
        'jonarrien/telescope-cmdline.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
        keys = {
            { '<S-Enter>', '<cmd>Telescope cmdline<CR>', { desc = 'Open Telescope command line' } },
        },
        config = function()
            require 'telescope'.load_extension 'cmdline'
        end
    },
    {
        'jvgrootveld/telescope-zoxide',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { '<Leader>j', function()
                return require 'telescope'.extensions.zoxide.list()
            end, { desc = 'Find zoxide directories' } }
        },
        config = function()
            require 'telescope'.load_extension 'zoxide'
        end,
    },
}
