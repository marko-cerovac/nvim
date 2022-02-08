require("nvim-dap-virtual-text").setup {
    commented = true,                  -- prefix virtual text with comment string
	text_prefix = '',
	separator = ',',
	error_prefix = '',
	info_prefix = '',
}

require("which-key").register({
	d = {
		name = "debugg",
		v = {"<cmd>DapVirtualTextToggle<CR>", "toggle virtual text"},
	},
}, { prefix = "<leader>" })
