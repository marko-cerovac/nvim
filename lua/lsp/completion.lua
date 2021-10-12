local cmp = require('cmp')
local luasnip = require('luasnip')

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
				" %s  %s ",
				require('lspkind').presets.default[vim_item.kind],
				vim_item.kind
			)
			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				nvim_lua = "(Lua)",
				buffer = "(BUF)",
				calc= "(CALC)",
				luasnip = "(SNIP)"
			})[entry.source.name]

			return vim_item
		end,
	},
	experimental = {
		ghost_text = true
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping(function (fallback)
			if cmp.visible() and cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true, }) then
				cmp.confirm()
			else
				fallback()
			end
		end),
		--[[ ["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}, ]]
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
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'nvim_lua' },
		{ name = 'calc' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	documentation = {
		border = 'rounded'
	}
}

--[[ require("luasnip").config.set_config {
	history = false,
	updateevents = "TextChanged,TextChangedI"
} ]]
