require('lualine').setup{
	options = {
		-- theme = 'material-nvim'
		theme = 'material-stealth'
	},
	extensions = {
		'nvim-tree'
	},
    sections = {
        lualine_a = {'mode'},
        lualine_b = { {'branch'}, {'diff'}, {'diagnostics', sources = {'nvim_diagnostic'}} },
        lualine_c = { {'filename'} },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
