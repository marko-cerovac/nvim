return {
    {
        'nvim-mini/mini.pick',
        lazy = false,
        dependencies = {
            'nvim-mini/mini.extra',
            'nvim-mini/mini.icons',
        },
        config = function()
            local pick = require 'mini.pick'
            local extra = require 'mini.extra'

            local win_config = function()
                local ret = {
                    border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                    width = vim.o.columns,
                    height = math.floor(vim.o.lines / 2),
                    relative = 'minibuffer',
                    use_minibuffer = true,
                }
                return ret
            end

            pick.setup {
                -- Delays (in ms; should be at least 1)
                delay = {
                    -- Delay between forcing asynchronous behavior
                    async = 10,

                    -- Delay between computation start and visual feedback about it
                    busy = 50,
                },

                -- Keys for performing actions. See `:h MiniPick-actions`.
                mappings = {
                    caret_left        = '<Left>',
                    caret_right       = '<Right>',

                    choose            = '<CR>',
                    choose_in_split   = '<M-s>',
                    choose_in_tabpage = '<M-t>',
                    choose_in_vsplit  = '<M-v>',
                    choose_marked     = '<M-CR>',

                    delete_char       = '<BS>',
                    delete_char_right = '<Del>',
                    delete_left       = '<C-u>',
                    delete_word       = '<C-w>',

                    mark              = '<C-x>',
                    mark_all          = '<C-a>',

                    move_down         = '<M-j>',
                    move_start        = '<M-g>',
                    move_up           = '<M-k>',

                    paste             = '<C-r>',

                    refine            = '<C-Space>',
                    refine_marked     = '<M-Space>',

                    scroll_down       = '<C-j>',
                    scroll_left       = '<C-h>',
                    scroll_right      = '<C-l>',
                    scroll_up         = '<C-k>',

                    stop              = '<Esc>',

                    toggle_info       = '<S-Tab>',
                    toggle_preview    = '<Tab>',
                },

                options = {
                    content_from_bottom = false,
                    use_cache = true,
                },

                -- Source definition. See `:h MiniPick-source`.
                -- source = {
                --     items = nil,
                --     name  = nil,
                --     cwd   = nil,
                --
                --     match   = nil,
                --     show    = nil,
                --     preview = nil,
                --
                --     choose        = nil,
                --     choose_marked = nil,
                -- },

                window = {
                    config = win_config
                }
                -- window = {
                --
                --     config = {
                --         relative = 'editor',
                --         anchor = 'SW',
                --         row = vim.o.lines - vim.o.cmdheight + 1,
                --         col = 0,
                --         width = vim.o.columns,
                --         height = math.floor(vim.o.lines / 2),
                --         border = vim.g.border_style,
                --     },
                --     prompt_caret = '▏',
                --     prompt_prefix = '> ',
                -- },
            }

            -- Set highlights to match command window
            pcall(vim.api.nvim_set_hl, 0, 'MiniPickBorder', { link = 'Normal' })
            pcall(vim.api.nvim_set_hl, 0, 'MiniPickBorderBusy', { link = 'Normal' })
            pcall(vim.api.nvim_set_hl, 0, 'MiniPickNormal', { link = 'Normal' })
            pcall(vim.api.nvim_set_hl, 0, 'MiniPickHeader', { link = 'Normal' })

            -- Use mini.pick's internal resume function to resume the picker
            vim.keymap.set('n', '<leader><CR>', '<cmd>Pick resume<CR>', { desc = 'Resume Picker' })

            vim.keymap.set('n', '<leader>e', function() extra.pickers.explorer() end, { desc = 'File explorer' })
            -- vim.keymap.set('n', '<leader>ff', function() pick.builtin.files() end, { desc = 'Search files' })
            vim.keymap.set('n', '<leader>fr', function() extra.pickers.oldfiles() end, { desc = 'Search recent files' })
            vim.keymap.set('n', '<leader>fg', function() pick.builtin.grep_live() end, { desc = 'Live grep' })
            vim.keymap.set('n', 'gb', function() pick.builtin.buffers() end, { desc = 'Search open buffers' })
            vim.keymap.set('n', '<leader>fh', function() pick.builtin.help() end, { desc = 'Search help tags' })

            vim.keymap.set('n', '<leader>gg', function() extra.pickers.git_files() end, { desc = 'Search git Files' })
            vim.keymap.set('n', '<leader>fd', function() extra.pickers.diagnostic() end, { desc = 'Search diagnostics' })
            -- vim.keymap.set('n', '<S-CR>', function() extra.pickers.commands() end, { desc = 'Search commands' })
            vim.keymap.set('n', '<leader>fl', function() extra.pickers.lsp({ scope = 'symbol' }) end,
                { desc = 'Search LSP Symbols' })

            -- 3. Custom Downloads Picker (Fully Lua)
            vim.keymap.set('n', 'gs', function()
                pick.builtin.files(nil, {
                    source = {
                        name = 'NeoVim config',
                        cwd = vim.fn.expand('~/.config/nvim')
                    }
                })
            end, { desc = 'Search Neovim config' })
        end
    },
    {
        'simifalaye/minibuffer.nvim',
        init = function()
            -- local minibuffer = require('minibuffer')

            vim.ui.select = require('minibuffer.builtin.ui_select')
            vim.ui.input = require('minibuffer.builtin.ui_input')

            -- vim.keymap.set('n', '<leader><CR>', function()
            --     minibuffer.resume(true)
            -- end)

            vim.g.minibuffer = {
                cmd = {
                    enabled = false,
                    -- dynamic_height = false,
                    max_height = 20,
                },
            }
        end,
    }
}
