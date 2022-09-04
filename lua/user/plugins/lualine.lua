local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("Module lualine not found", vim.log.levels.WARN)
end

lualine.setup{
	options = {
		theme = "auto",
		globalstatus = true,
	},
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", {"diff", symbols = {added = " ", modified = " ", removed = " "}} },
        lualine_c = { {"diagnostics", sources = {"nvim_diagnostic"}, always_visible = true} },
        lualine_x = { "filename", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    }
}
