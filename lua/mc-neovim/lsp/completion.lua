local cmp = require('cmp')
local luasnip = require('luasnip')

local icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = 'ﰠ',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '塞',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = 'פּ',
	Event = '',
	Operator = '',
	TypeParameter = '',
}


local check_backspace = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- load lspkind icons
			vim_item.kind = string.format(
				" %s  [ %s ] ",
				icons[vim_item.kind],
				vim_item.kind
			)
			vim_item.menu = ({
				nvim_lsp = "( lsp)",
				nvim_lua = "( nvim)",
				treesitter = "(滑 ts)",
				buffer = "(﬘ buff)",
				calc= "( calc)",
				luasnip = "( snip)",
				path = "( path)"
			})[entry.source.name]

			return vim_item
		end,
	},
	experimental = {
		ghost_text = true
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		['<C-y>'] = cmp.config.disable,
		["<C-e>"] = cmp.mapping.close({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "calc" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "treesitter" },
		{ name = "neorg" },
	},
	documentation = {
		-- border = 'rounded',
		border = "single",
		winhighlight = "",
	}
}

--[[ require("luasnip").config.set_config {
	history = false,
	updateevents = "TextChanged,TextChangedI"
} ]]
