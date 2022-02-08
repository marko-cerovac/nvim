require("lspsaga").setup {
	finder_action_keys = {
		open = "<CR>",
		vsplit = "v",
		split = "s",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	rename_action_keys = {
		quit = "<Esc>",
		exec = "<CR>"
	},
	rename_prompt_prefix = "➤ Rename: ",
	rename_prompt_populate = false,
	-- border_style = "round",
}
