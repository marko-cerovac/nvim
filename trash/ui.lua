return {
    {
        'echasnovski/mini.indentscope',
        cmd = 'ShowIndent',
        config = function()
            require 'mini.indentscope'.setup {
                -- symbol = '╎',
                symbol = '│',
            }
            vim.api.nvim_create_user_command('ShowIndent', function()
                if vim.g.miniindentscope_disable == nil then
                    vim.g.miniindentscope_disable = false
                    return
                end
                vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
            end, {})
        end
    },
}
