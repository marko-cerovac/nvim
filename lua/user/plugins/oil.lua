return {
{
        'stevearc/oil.nvim',
        dependencies = { 'nvim-mini/mini.icons' },
        keys = {
            { 'go', '<cmd>Oil<CR>' },
            { '-', '<cmd>Oil<CR>' },
        },
        cmd = {
            'Oil'
        },
        opts = {
            default_file_explorer = true,
            -- columns = {
            --     'icon',
            --     'permissions',
            --     'size',
            --      'mtime',
            -- },
            keymaps = {
                ['go'] = 'actions.close',
                -- ['<Esc>'] = 'actions.close',
                ["gl"] = function()
                    if vim.g.oil_list_long ~= true then
                        vim.g.oil_list_long = true
                        require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
                    else
                        vim.g.oil_list_long = false
                        require('oil').set_columns({ 'icon' })
                    end
                end,
            }
        }
    }
}
