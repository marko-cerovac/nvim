require("lualine").setup{
	options = {
		theme = "auto",
		globalstatus = true,
		--[[ component_separators = '|',
		section_separators = { left = '▌', right = '▐'}, ]]
	},
	-- extensions = {
	-- 	"nvim-tree"
	-- },
    sections = {
        lualine_a = {"mode"},
        lualine_b = { {"branch"}, {"diff"}, {"diagnostics", sources = {"nvim_diagnostic"}, always_visible = false} },
        lualine_c = { {"filename"}, {"filesize"} },
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    }
}
