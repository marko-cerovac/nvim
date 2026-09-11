return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        branch = 'main',
        -- event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local treesitter = require('nvim-treesitter')

            treesitter.setup()
            treesitter.install {
                'lua',
                'vim',
                'c',
                'cpp',
                'rust',
                'java',
                'python',
                'bash',
                'zsh',
                'nu',
                'toml',
                'json',
                'markdown',
                'markdown_inline',
            }

            ---@param buf integer
            ---@param language string
            local function try_attach(buf, language)
                if not vim.treesitter.language.add(language) then
                    return
                end
                vim.treesitter.start(buf, language)
                local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
                if has_indent_query then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end

            local parsers = treesitter.get_available()

            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    local buf, filetype = args.buf, args.match
                    local language = vim.treesitter.language.get_lang(filetype)

                    if not language then return end

                    local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

                    if vim.tbl_contains(installed_parsers, language) then
                        -- Enable the parser if it is already installed
                        try_attach(buf, language)
                    elseif vim.tbl_contains(parsers, language) then
                        -- If a parser is available in `nvim-treesitter`,
                        -- auto-install it and enable it after the installation is done
                        require('nvim-treesitter').install(language):await(function() try_attach(buf, language) end)
                    else
                        -- Try to enable treesitter features in case the parser
                        -- exists but is not available from `nvim-treesitter`
                        try_attach(buf, language)
                    end
                end,
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        branch = 'main',
        event = { 'BufReadPost', 'BufNewFile' },
        init = function()
            -- avoid conflicts with some mappings
            vim.g.no_plugin_maps = true
        end,
        config = function()
            local textobject      = require('nvim-treesitter-textobjects.select').select_textobject
            local goto_next_start = require('nvim-treesitter-textobjects.move').goto_next_start
            local goto_next_end   = require('nvim-treesitter-textobjects.move').goto_next_end
            local goto_prev_start = require('nvim-treesitter-textobjects.move').goto_previous_start
            local goto_prev_end   = require('nvim-treesitter-textobjects.move').goto_previous_end
            local repeat_move     = require('nvim-treesitter-textobjects.repeatable_move')

            require('nvim-treesitter-textobjects').setup {
                select = {
                    lookahead = true,
                    selection_modes = {
                        ['@function.outer'] = 'v',
                        ['@conditional.outer'] = 'v',
                        ['@comment.outer'] = 'v',
                        ['@loop.outer'] = 'v',
                        ['@class.outer'] = 'v',
                    },
                },
                move = { set_jumps = true },
                include_surrounding_whitespace = false,
            }

            -- selection
            vim.keymap.set({ 'x', 'o' }, 'af', function()
                    textobject('@function.outer', 'textobjects')
                end,
                { desc = 'Select around function' }
            )
            vim.keymap.set({ 'x', 'o' }, 'if', function()
                    textobject('@function.inner', 'textobjects')
                end,
                { desc = 'Select inside function' }
            )
            vim.keymap.set({ 'x', 'o' }, 'ai', function()
                    textobject('@conditional.outer', 'textobjects')
                end,
                { desc = 'Select around conditional' }
            )
            vim.keymap.set({ 'x', 'o' }, 'ii', function()
                    textobject('@conditional.inner', 'textobjects')
                end,
                { desc = 'Select inside conditional' }
            )
            vim.keymap.set({ 'x', 'o' }, 'ac', function()
                    textobject('@comment.outer', 'textobjects')
                end,
                { desc = 'Select around comment block' }
            )
            vim.keymap.set({ 'x', 'o' }, 'ic', function()
                    textobject('@comment.inner', 'textobjects')
                end,
                { desc = 'Select inside comment block' }
            )
            vim.keymap.set({ 'x', 'o' }, 'al', function()
                    textobject('@loop.outer', 'textobjects')
                end,
                { desc = 'Select around loop' }
            )
            vim.keymap.set({ 'x', 'o' }, 'il', function()
                    textobject('@loop.inner', 'textobjects')
                end,
                { desc = 'Select inside loop' }
            )
            vim.keymap.set({ 'x', 'o' }, 'at', function()
                    textobject('@class.outer', 'textobjects')
                end,
                { desc = 'Select around type' }
            )
            vim.keymap.set({ 'x', 'o' }, 'it', function()
                    textobject('@class.inner', 'textobjects')
                end,
                { desc = 'Select inside type' }
            )

            -- jumping: functions
            vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
                    goto_next_start('@function.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next function' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
                    goto_prev_start('@function.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of previous function' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
                    goto_next_end('@function.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next function' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
                    goto_prev_end('@function.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous function' }
            )
            -- jumping: blocks
            vim.keymap.set({ 'n', 'x', 'o' }, ']b', function()
                    goto_next_start('@block.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[b', function()
                    goto_prev_start('@block.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of previous block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']B', function()
                    goto_next_end('@block.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[B', function()
                    goto_prev_end('@block.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous block' }
            )
            -- jumping: comments
            vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
                    goto_next_start('@comment.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next comment block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
                    goto_prev_start('@comment.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of previous comment block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
                    goto_next_end('@comment.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next comment block' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
                    goto_prev_end('@comment.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous comment block' }
            )
            -- jumping: classes
            vim.keymap.set({ 'n', 'x', 'o' }, ']t', function()
                    goto_next_start('@class.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next type' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[t', function()
                    goto_prev_start('@class.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of previous type' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']T', function()
                    goto_next_end('@class.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next type' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[T', function()
                    goto_prev_end('@class.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous type' }
            )
            -- jumping: conditionals (ifs and buts)
            vim.keymap.set({ 'n', 'x', 'o' }, ']i', function()
                    goto_next_start('@conditional.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next conditional' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[i', function()
                    goto_prev_start('@conditional.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of prevoius conditional' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']I', function()
                    goto_next_end('@conditional.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next conditional' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[I', function()
                    goto_prev_end('@conditional.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous conditional' }
            )
            -- jumping: loops
            vim.keymap.set({ 'n', 'x', 'o' }, ']l', function()
                    goto_next_start('@loop.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of next loop' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[l', function()
                    goto_prev_start('@loop.outer', 'textobjects')
                end,
                { desc = 'Jump to the beginning of previous loop' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, ']L', function()
                    goto_next_end('@loop.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of next loop' }
            )
            vim.keymap.set({ 'n', 'x', 'o' }, '[L', function()
                    goto_prev_end('@loop.outer', 'textobjects')
                end,
                { desc = 'Jump to the end of previous loop' }
            )

            -- make actions ',' and ';' repeatable
            vim.keymap.set({ 'n', 'x', 'o' }, ';', repeat_move.repeat_last_move_next)
            vim.keymap.set({ 'n', 'x', 'o' }, ',', repeat_move.repeat_last_move_previous)
            -- also make it work with f and F
            vim.keymap.set({ 'n', 'x', 'o' }, 'f', repeat_move.builtin_f_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 'F', repeat_move.builtin_F_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 't', repeat_move.builtin_t_expr, { expr = true })
            vim.keymap.set({ 'n', 'x', 'o' }, 'T', repeat_move.builtin_T_expr, { expr = true })
        end,
    }
}
