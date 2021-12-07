local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
	border_style = "round",
	rename_action_keys = {
		quit = "<Esc>",
		exec = "<CR>"
	},
	rename_prompt_prefix = " ➤ ",
	rename_prompt_populate = false,
}
