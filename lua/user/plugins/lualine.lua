require("lualine").setup{
	options = {
		theme = "auto",
		globalstatus = true,
	},
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { {"diagnostics", sources = {"nvim_diagnostic"}, always_visible = true} },
        lualine_x = { "filename", "filesize", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    }
}
