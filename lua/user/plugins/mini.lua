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
        'nvim-mini/mini.pairs',
        event = 'InsertEnter',
        config = true,
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
        config = true
    },
}
