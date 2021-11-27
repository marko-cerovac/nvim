require('neorg').setup {
	load = {
		["core.defaults"] = {},	-- Tells neorg to load the module called core.defaults with no extra data
		["core.norg.concealer"] = {}, -- Since this module isn't part of core.defaults, we can include it ourselves, like so
		["core.neorgcmd"] = {}, -- A module for interacting with the :Neorg command
		["core.keybinds"] = { -- Configure core.keybinds
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = "<Leader>o" -- This is the default if unspecified
			}
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
			}
		},
		--[[ ["core.norg.dirman"] = {
			config = {
				workspaces = {
						my_workspace = "~/Documents/neorg"
				},
				-- Automatically detect whenever we have entered a subdirectory of a workspace
				autodetect = true,
				-- Automatically change the directory to the root of the workspace every time
				autochdir = true,
			}
		}, -- Loads the directory manager with no configuration ]]
		["core.highlights"] = {}, -- Manages Neorg highlight groups and their colours
	},
}
