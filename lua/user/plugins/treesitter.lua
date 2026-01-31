return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local treesitter = require('nvim-treesitter')

            treesitter.setup()
            treesitter.install {
                'c',
                'cpp',
                'rust',
                'java',
                'vim',
                'lua',
                'bash',
                'toml',
                'markdown',
                'markdown_inline',
            }

            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    local lang = vim.treesitter
                        .language
                        .get_lang(vim.bo[args.buf].filetype)

                    if lang then
                        pcall(vim.treesitter.start, args.buf, lang)
                        -- vim.treesitter.start(args.buf, lang)

                        -- enable treesitter folding
                        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                        vim.wo[0][0].foldmethod = 'expr'
                    end
                end,
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        branch = 'main',
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
            local map             = vim.keymap.set

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
            map({ 'x', 'o' }, 'af', function() textobject('@function.outer', 'textobjects') end)
            map({ 'x', 'o' }, 'if', function() textobject('@function.inner', 'textobjects') end)
            map({ 'x', 'o' }, 'ai', function() textobject('@conditional.outer', 'textobjects') end)
            map({ 'x', 'o' }, 'ii', function() textobject('@conditional.inner', 'textobjects') end)
            map({ 'x', 'o' }, 'ac', function() textobject('@comment.outer', 'textobjects') end)
            map({ 'x', 'o' }, 'ic', function() textobject('@comment.inner', 'textobjects') end)
            map({ 'x', 'o' }, 'al', function() textobject('@loop.outer', 'textobjects') end)
            map({ 'x', 'o' }, 'il', function() textobject('@loop.inner', 'textobjects') end)
            map({ 'x', 'o' }, 'at', function() textobject('@class.outer', 'textobjects') end)
            map({ 'x', 'o' }, 'it', function() textobject('@class.inner', 'textobjects') end)

            -- jumping: functions
            map({ 'n', 'x', 'o' }, ']f', function() goto_next_start('@function.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[f', function() goto_prev_start('@function.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']F', function() goto_next_end('@function.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[F', function() goto_prev_end('@function.outer', 'textobjects') end)
            -- jumping: blocks
            map({ 'n', 'x', 'o' }, ']b', function() goto_next_start('@block.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[b', function() goto_prev_start('@block.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']B', function() goto_next_end('@block.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[B', function() goto_prev_end('@block.outer', 'textobjects') end)
            -- jumping: comments
            map({ 'n', 'x', 'o' }, ']c', function() goto_next_start('@comment.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[c', function() goto_prev_start('@comment.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']C', function() goto_next_end('@comment.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[C', function() goto_prev_end('@comment.outer', 'textobjects') end)
            -- jumping: classes
            map({ 'n', 'x', 'o' }, ']t', function() goto_next_start('@class.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[t', function() goto_prev_start('@class.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']T', function() goto_next_end('@class.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[T', function() goto_prev_end('@class.outer', 'textobjects') end)
            -- jumping: conditionals (ifs and buts)
            map({ 'n', 'x', 'o' }, ']i', function() goto_next_start('@conditional.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[i', function() goto_prev_start('@conditional.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']I', function() goto_next_end('@conditional.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[I', function() goto_prev_end('@conditional.outer', 'textobjects') end)
            -- jumping: loops
            map({ 'n', 'x', 'o' }, ']l', function() goto_next_start('@loop.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[l', function() goto_prev_start('@loop.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, ']L', function() goto_next_end('@loop.outer', 'textobjects') end)
            map({ 'n', 'x', 'o' }, '[L', function() goto_prev_end('@loop.outer', 'textobjects') end)

            -- make actions ',' and ';' repeatable
            map({ 'n', 'x', 'o' }, ';', repeat_move.repeat_last_move_next)
            map({ 'n', 'x', 'o' }, ',', repeat_move.repeat_last_move_previous)
            -- also make it work with f and F
            map({ 'n', 'x', 'o' }, 'f', repeat_move.builtin_f_expr, { expr = true })
            map({ 'n', 'x', 'o' }, 'F', repeat_move.builtin_F_expr, { expr = true })
            map({ 'n', 'x', 'o' }, 't', repeat_move.builtin_t_expr, { expr = true })
            map({ 'n', 'x', 'o' }, 'T', repeat_move.builtin_T_expr, { expr = true })
        end,
    }
}
