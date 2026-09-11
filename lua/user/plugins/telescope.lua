return {
    {
        'nvim-telescope/telescope.nvim',
        -- branch = '0.1.x',
        event = 'UIEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope       = require 'telescope'
            local actions         = require 'telescope.actions'
            local themes          = require 'telescope.themes'
            local layout          = require 'telescope.actions.layout'
            local builtin         = require 'telescope.builtin'

            local neovim_settings = function()
                require 'telescope.builtin'.find_files {
                    previewer = false,
                    prompt_title = 'NeoVim Settings',
                    cwd = vim.fn.stdpath 'config',
                    -- cwd = vim.fn.stdpath 'config' .. '/lua/user',
                }
            end

            telescope.setup {
                defaults = themes.get_ivy {
                    -- defaults = {
                    mappings = {
                        i = {
                            ['<M-j>'] = actions.move_selection_next,
                            ['<M-k>'] = actions.move_selection_previous,
                            ['<C-s>'] = actions.select_horizontal,
                            ['<C-p>'] = layout.toggle_preview
                        },
                        n = {
                            ['s'] = actions.select_horizontal,
                            ['v'] = actions.select_vertical,
                            ['t'] = actions.select_tab,
                            ['p'] = layout.toggle_preview
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
                    help_tags = { previewer = false },
                    commands = { theme = 'dropdown' },
                    -- marks = { theme = 'dropdown' },
                    colorscheme = { theme = 'dropdown' },
                    lsp_references = { theme = 'cursor' },
                    git_files = { show_untracked = true },
                    git_commits = { previewer = false },
                },
                extensions = {
                    ['ui-select'] = {
                        themes.get_dropdown { initial_mode = 'normal' }
                    },
                    ['file_browser'] = {
                        previewer = false,
                        hijack_netrw = true,
                    },
                    -- ['cmdline'] = {
                    --     mappings = {
                    --         complete      = '<Tab>',
                    --         run_selection = '<CR>',
                    --         run_input     = '<C-CR>',
                    --     }
                    -- }
                },
                ['fzf'] = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }

            -- load extensions
            telescope.load_extension 'fzf'
            telescope.load_extension 'ui-select'

            vim.keymap.set('n', 'gs', neovim_settings, { desc = 'Find NeoVim settings' })
            vim.keymap.set('n', 'g;', builtin.buffers, { desc = 'Find open buffers' })
            vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'Find LSP references' })
            vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { desc = 'Show LSP document symbols' })
            vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = 'Find LSP implementations' })
            vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Grep directory' })
            vim.keymap.set('n', '<Leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
            vim.keymap.set('n', '<Leader>ft', builtin.colorscheme, { desc = 'Find colorschemes' })
            vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = 'Find help tags' })
            vim.keymap.set('n', '<Leader>fm', builtin.marks, { desc = 'Find marks' })
            vim.keymap.set('n', '<Leader>gg', builtin.git_files, { desc = 'Find Git files' })
            vim.keymap.set('n', '<Leader>gc', builtin.git_commits, { desc = 'Find Git commits' })
            vim.keymap.set('n', '<Leader>gb', builtin.git_branches, { desc = 'Find Git branches' })
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
                return require 'telescope'.extensions.file_browser.file_browser({
                    path = vim.fn.expand('%:p:h'),
                    select_buffer = true
                })
            end, { desc = 'Open Telescope file browser' }
            },
        },
        config = function()
            require 'telescope'.load_extension 'file_browser'
        end
    },
}
