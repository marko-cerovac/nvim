local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	vim.notify "Module luasnip not found"
	return
end

local map = vim.keymap.set

ls.config.set_config = {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,

	-- ext_opts = nil,
	--[[ ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			}
		}
	} ]]
}

map({ "i", "s"}, "<M-f>", function ()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_input("<M-f>")
	end
end, { silent = true })

map({ "i", "s"}, "<M-F>", function ()
	if ls.expand_or_jumpable(-1) then
		ls.expand_or_jump(-1)
	else
		vim.api.nvim_input("<M-F>")
	end
end, { silent = true })

map("i", "<M-d>", function ()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

ls.snippets = {
	--[[ all = {
	}, ]]

	lua = {
		ls.parser.parse_snippet("expand", "-- this is what was expanded!"),

	},

	--[[ cpp = {

	}, ]]
}
