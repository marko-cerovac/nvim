return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } } },
                lualine_c = {
                    { 'lsp_status' },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                        always_visible = true
                    },
                },
                lualine_x = { 'filename', 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress', 'searchcount', 'selectioncount', },
                lualine_z = { 'location' },
            }
        },
    },
}
