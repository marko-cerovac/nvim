---@diagnostic disable: undefined-field
return {
    {
        'nickjvandyke/opencode.nvim',
        version = '*',
        keys = {
            { 'ga', function()
                require('opencode').toggle()
            end, { desc = 'Toggle opencode' } },
            {
                '<Leader>ca',
                function()
                    require('opencode').ask('@this: ', { submit = true })
                end,
                { desc = 'Ask opencode…' },
                mode = { 'n', 'x' }
            },
            {
                '<Leader>cs',
                function()
                    require('opencode').select()
                end,
                { desc = 'Execute opencode action…' },
                mode = { 'n', 'x' }
            },
        },
        config = function()
            -- make the window wider
            vim.g.opencode_opts = {
                server = {
                    start = function()
                        require("opencode.terminal").open("opencode --port", {
                            split = "right",
                            width = math.floor(vim.o.columns * 0.5),
                        })
                    end,
                    toggle = function()
                        require("opencode.terminal").toggle("opencode --port", {
                            split = "right",
                            width = math.floor(vim.o.columns * 0.5),
                        })
                    end,
                },
            }

            -- vim.o.autoread = true -- already 'true'

            vim.keymap.set('n', '<S-C-u>', function()
                require('opencode').command('session.half.page.up')
            end, { desc = 'Scroll opencode up' })

            vim.keymap.set('n', '<S-C-d>', function()
                require('opencode').command('session.half.page.down')
            end, { desc = 'Scroll opencode down' })

            vim.keymap.set({ 'n', 'x' }, '<Leader>cr', function()
                return require('opencode').operator('@this ')
            end, { desc = 'Add range to opencode', expr = true })

            vim.keymap.set('n', '<Leader>cl', function()
                return require('opencode').operator('@this ') .. '_'
            end, { desc = 'Add line to opencode', expr = true })
        end,
    }
}
