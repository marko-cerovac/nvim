local dashboard = require("dashboard")

dashboard.preview_file_height = 32
dashboard.preview_file_width = 68

local custom_header = function ()
local header = {
	[[                                                                  ]],
	[[                                                                  ]],
	[[                                                                  ]],
	[[                                                                  ]],
	[[                                                                  ]],
	[[                         .|.            |.                        ]],
	[[                       .cc|:;           |::.                      ]],
	[[                     .cccc|:::;         |::::.                    ]],
	[[                    |ccccc|::::;        |:::::|                   ]],
	[[                    |ccccc|::::::;      |:::::|                   ]],
	[[         ___        |ccccc|:::::::;     |:::::|         ___       ]],
	[[        /\  \       |ccccc| ;:::::::;   |:::::|        /\__\      ]],
	[[       |::\  \      |ccccc|  ;:::::::;  |:::::|       /:/  /      ]],
	[[       |:|:\  \     |ccccc|   ;:::::::; |:::::|      /:/  /       ]],
	[[     __|:|\:\  \    |ccccc|     ;:::::::|:::::|     /:/  /  ___   ]],
	[[    /::::|_\:\__\   |ccccc|      ;::::::|:::::|    /:/__/  /\__\  ]],
	[[    \:\~~\  \/__/   |ccccc|        ;::::|:::::|    \:\  \ /:/  /  ]],
	[[     \:\  \          .cccc|         ;:::|::::.      \:\  /:/  /   ]],
	[[      \:\  \           .cc|           ;;|::.         \:\/:/  /    ]],
	[[       \:\__\            .|            .|.            \::/  /     ]],
	[[        \/__/                                          \/__/      ]],
	[[                                                                  ]],
	[[                                                                  ]],
	[[                            N E O V I M                           ]],
	[[                                                                  ]],
	[[                                                                  ]],
}
	return header
end
dashboard.custom_header = custom_header()

dashboard.custom_center = {
	{
		icon = "פּ  ",
		desc = "File Tree                            ",
		shortcut = "SPC e  ",
		action = function ()
					vim.cmd "PackerLoad nvim-tree.lua"
					vim.cmd "NvimTreeToggle"
		end
	},
	{
		icon = "  ",
		desc = "File Explorer                        ",
		shortcut = "SPC f e",
		action = function ()
					vim.cmd "PackerLoad telescope.nvim"
					vim.cmd "Telescope file_browser"
		end
	},
	{
		icon = "  ",
		desc = "Recently Used Files                  ",
		shortcut = "SPC f r",
		action = function ()
					vim.cmd "PackerLoad telescope.nvim"
					vim.cmd "Telescope oldfiles"
		end
	},
	{
		icon = "  ",
		desc = "Find Word                            ",
		shortcut = "SPC f g",
		action = function ()
					vim.cmd "PackerLoad telescope.nvim"
					vim.cmd "Telescope live_grep"
		end
	},
	{
		icon = "  ",
		desc = "Open a Terminal                      ",
		shortcut = "SPC t o",
		action = "terminal"
	},
	{
		icon = "  ",
		desc = "Settings                             ",
		shortcut = "SPC f s",
		action = function ()
					vim.cmd "PackerLoad telescope.nvim"
					require("mc-neovim.plugins.telescope").neovim_rc()
		end
	},
	{
		icon = "  ",
		desc = "Quit                                        ",
		action = "q!"
	},
}

local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
dashboard.custom_footer = { "NeoVim loaded " .. plugins_count .. " plugins" }

--[[ dashboard.custom_footer = {
	"The editor of the Beast"
} ]]
