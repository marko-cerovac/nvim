return {
    {
        'nvim-mini/mini.icons',
        opts = {},
        -- replace nvim-web-devicons with mini.icons
        specs = {
            { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
        },
        init = function()
            package.preload['nvim-web-devicons'] = function()
                require('mini.icons').mock_nvim_web_devicons()
                return package.loaded['nvim-web-devicons']
            end
        end,
    },
    {
        'nvim-mini/mini.hipatterns',
        cmd = 'Colorize',
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end
    },
    {
        'nvim-mini/mini.surround',
        keys = {
            { 's', mode = { 'n', 'v' } },
        },
        config = true
    },
    {
        'nvim-mini/mini.splitjoin',
        keys = { 'gS' },
        config = true -- hello
    },
    -- {
    --     'nvim-mini/mini.pairs',
    --     event = 'InsertEnter',
    --     config = true,
    -- },
}
