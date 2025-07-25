return {
    {
        'echasnovski/mini.notify',
        config = function()
            local notify = require 'mini.notify'

            notify.setup {
                content = {
                    format = function(notif)
                        local icon = ' '

                        if notif.level == 'DEBUG' then
                            icon = ''
                        elseif notif.level == 'ERROR' then
                            icon = ''
                        elseif notif.level == 'INFO' then
                            icon = ''
                        elseif notif.level == 'TRACE' then
                            icon = ''
                        elseif notif.level == 'WARN' then
                            icon = ''
                        end

                        return string.format('%s | %s', icon, notif.msg)
                    end
                },
                lsp_progress = {
                    enable = true
                },
                window = {
                    -- config = {
                        -- border = vim.g.border_style
                    -- },
                    winblend = 0
                }
            }

            vim.notify = notify.make_notify()
        end,
    },
    {
        'echasnovski/mini.icons',
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
        'echasnovski/mini.comment',
        keys = {
            { '<Leader>k', mode = { 'n', 'v' } },
            'gc',
        },
        opts = {
            ignore_blank_line = true,
            mappings = {
                comment = '<Leader>k',
                comment_line = '<Leader>k',
                comment_visual = '<Leader>k',
                textobject = 'gc',
            }
        }
    },
    {
        'echasnovski/mini.pairs',
        event = 'InsertEnter',
        config = true,
    },
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
    {
        'echasnovski/mini.surround',
        keys = {
            { 's', mode = { 'n', 'v' } },
        },
        config = true
    },
    {
        'echasnovski/mini.splitjoin',
        keys = { 'gS' },
        config = true
    },
}
