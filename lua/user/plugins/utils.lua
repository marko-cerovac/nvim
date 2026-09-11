return {
    {
        'norcalli/nvim-colorizer.lua',
        cmd = 'ColorizerToggle',
        init = function()
            vim.cmd 'cabbrev ct ColorizerToggle'
        end
    },
}
