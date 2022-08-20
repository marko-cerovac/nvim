-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local bufopts = { noremap=true, silent=true, buffer = true }

	-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', '[c', function() vim.diagnostic.goto_prev({ float = { border = vim.g.border_style }}) end, bufopts)
	-- vim.keymap.set('n', ']c', function() vim.diagnostic.goto_next({ float = { border = vim.g.border_style }}) end, bufopts)
	vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set('n', '<leader>cl', function() vim.diagnostic.open_float({ border = vim.g.border_style }) end, bufopts)
	vim.keymap.set("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>cwx", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>cwl", function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
	-- vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ct",vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>cf",vim.lsp.buf.formatting, bufopts)
	-- vim.keymap.set("v", "<leader>cf",vim.lsp.buf.range_format, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references(), bufopts)

	-- LPSAGA
	vim.keymap.set("n", "K", function () require('lspsaga.hover').render_hover_doc() end, bufopts)
	vim.keymap.set("n", "<leader>ch", function() require("lspsaga.finder").lsp_finder() end, bufopts)
	vim.keymap.set("n", "<leader>cr", function() require('lspsaga.rename').lsp_rename() end, bufopts)
	vim.keymap.set("n", "<leader>ca", function() require('lspsaga.codeaction').code_action() end, bufopts)
	vim.keymap.set("n", "<leader>cs", function() require('lspsaga.signaturehelp').signature_help() end, bufopts)
	vim.keymap.set("n", "<leader>cp", function() require('lspsaga.definition').preview_definition() end, bufopts)
	vim.keymap.set("n", "<leader>cl", function() require('lspsaga.diagnostic').show_line_diagnostics() end, bufopts)
	vim.keymap.set("n", "<leader>co", "<cmd>LSoutlineToggle<CR>", bufopts)
	vim.keymap.set("n", "[c", function() require("lspsaga.diagnostic").goto_next() end, bufopts)
	vim.keymap.set("n", "]c", function() require("lspsaga.diagnostic").goto_prev() end, bufopts)
	vim.keymap.set("n", "<C-u>", function() return require('lspsaga.action').smart_scroll_with_saga(-1) end, bufopts)
	vim.keymap.set("n", "<C-d>", function() return require('lspsaga.action').smart_scroll_with_saga(1) end, bufopts)

	vim.diagnostic.config ({
		virtual_text = {
			prefix = "●", -- Could be "", "▎", "x"
		},
		signs = true,
		underline = true,
		update_in_insert = false

	})
	-- Rounded hover borders
	--[[ vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {
		border = vim.g.border_style
	}) ]]
	--[[ vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = vim.g.border_style,
		focusable = false,
		relative = "cursor",
	}) ]]

	-- Highlight symbol under cursor
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup('lsp_document_highlight', {
			clear = false
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = 'lsp_document_highlight',
		})
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

end

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
	local opts = _default_opts(options)
	opts.border = vim.g.border_style
	return opts
end

vim.keymap.set("n", "gr", "<cmd>PackerLoad lsp-trouble.nvim<CR><cmd>TroubleToggle lsp_references<CR>", { silent = true, noremap = true })

-- Enable code snippets
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())


capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

--[[ local lsp_flags = {
	debounce_text_changes = 150
} ]]

-- Define signs
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", texthl = "DiagnosticSignHint", numhl = ""})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo", numhl = ""})

--[[ local lsp_servers = {
	"clangd",
	"cmake",
	"bashls",
	"jdtls",
	"sumenko_lua",
	"rust_analyzer"

} ]]

require("lspconfig")["clangd"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	--[[ settings = {
		["clangd"] = {}
	} ]]
}
require("lspconfig")["cmake"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	--[[ settings = {
		["cmake"] = {}
	} ]]
}
require("lspconfig")["bashls"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	--[[ settings = {
		["bashls"] = {}
	} ]]
}
require("lspconfig")["jdtls"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	--[[ settings = {
		["jdtls"] = {}
	} ]]
}
require("lspconfig")["sumneko_lua"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	--[[ settings = {
		["sumneko_lua"] = {}
	} ]]
}
--[[ require("lspconfig")["rust_analyzer"].setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust_analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
} ]]


--[[ return {
	-- Enable code snippets
	capabilities = capabilities,
	-- map buffer local bindings
	on_attach = on_attach,
	-- add flags
	-- lsp_flags = lsp_flags
} ]]
