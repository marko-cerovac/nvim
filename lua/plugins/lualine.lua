require('lualine').setup{
    options = {
        theme = 'material-nvim',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = { {'branch'}, {'diff'} },
        lualine_c = { {'diagnostics', sources = {'nvim_lsp'}}, {'filename'} },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}

