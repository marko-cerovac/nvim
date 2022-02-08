require("neorg").setup {
	load = {
		["core.defaults"] = {},	-- Tells neorg to load the module called core.defaults with no extra data
		["core.norg.concealer"] = {}, -- Since this module isn't part of core.defaults, we can include it ourselves, like so
		["core.neorgcmd"] = {}, -- A module for interacting with the :Neorg command
		["core.keybinds"] = { -- Configure core.keybinds
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = "<leader>o" -- This is the default if unspecified
			}
		},
		["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
		["core.integrations.nvim-cmp"] = {},
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

-- -- Loads the Neorg completion module
-- local function load_completion()
--     neorg.modules.load_module("core.norg.completion", nil, {
--         engine = "nvim-cmp" -- Choose your completion engine here
--     })
-- end
--
-- -- If Neorg is loaded already then don't hesitate and load the completion
-- if neorg.is_loaded() then
--     load_completion()
-- else -- Otherwise wait until Neorg gets started and load the completion module then
--     neorg.callbacks.on_event("core.started", load_completion)
-- end
