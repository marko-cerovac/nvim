local map = vim.keymap.set
-- local border_opts = { border = vim.g.border_style }

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify "Module lspconfig not found"
	return
end

local status_ok, telescope = pcall(require, "telescope.builtin")
if not status_ok then
	vim.notify "Module telescope not found"
	return
end

local on_attach = function(client, bufnr)

	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	-- TODO: if borders dont show, uncomment these
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gD", telescope.lsp_definitions, bufopts)
	map("n", "gd", telescope.lsp_type_definitions, bufopts)
	map("n", "gi", telescope.lsp_implementations, bufopts)
	map("n", "gl", vim.diagnostic.open_float, bufopts)
	map("n", "gr", telescope.lsp_references, bufopts)
	map("n", "[c", vim.diagnostic.goto_prev, bufopts)
	map("n", "]c", vim.diagnostic.goto_next, bufopts)

	map("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "<leader>cf", vim.lsp.buf.formatting, bufopts)
	map("n", "<leader>cd", telescope.diagnostics, bufopts)
	map("n", "<leader>co", telescope.lsp_document_symbols, bufopts)
	map("n", "<leader>cs", vim.lsp.buf.signature_help, bufopts)
	map("n", "<leader>cwa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<leader>cwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<leader>cwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<leader>cq", vim.diagnostic.setloclist, bufopts)

	-- Highlight symbol under cursor
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end


vim.diagnostic.config ({
	virtual_text = {
		-- prefix = "●", -- Could be "■", "▎", "x"
		-- prefix = "",
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = false

})

-- Borders for LspInfo winodw
-- local win = lspconfig.ui.windows
-- local _default_opts = win.default_opts
-- 
-- win.default_opts = function(options)
	-- 	local win_opts = _default_opts(options)
	-- 	win_opts.border = vim.g.border_style
	-- 	return win_opts
	-- end

	-- Rounded hover borders
	--[[ local handlers =  {
		["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover,
		{border = vim.g.border_style}
		),
		["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help,
		{border = vim.g.border_style, focusable = false, relative = "cursor" }
		),
	} ]]
	-- TODO: if borders dont show, delete this
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or vim.g.border_style
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end


	-- Enable code snippets
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	-- local completionItem = capabilities.textDocument.completion.completionItem

	-- TODO: if completion works great, delete this
	--[[ completionItem.snippetSupport = true
	completionItem.preselectSupport = true
	completionItem.insertReplaceSupport = true
	completionItem.labelDetailsSupport = true
	completionItem.deprecatedSupport = true
	completionItem.commitCharactersSupport = true
	completionItem.tagSupport = { valueSet = { 1 } }
	completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	} ]]

	vim.fn.sign_define("DiagnosticSignError",
	{text = " ", texthl = "DiagnosticSignError", numhl = ""}
	)
	vim.fn.sign_define("DiagnosticSignWarn",
	{text = " ", texthl = "DiagnosticSignWarn", numhl = ""}
	)
	vim.fn.sign_define("DiagnosticSignHint",
	{text = "ﴞ ", texthl = "DiagnosticSignHint", numhl = ""}
	)
	vim.fn.sign_define("DiagnosticSignInfo",
	{text = " ", texthl = "DiagnosticSignInfo", numhl = ""}
	)

	local lsp_flags = {
		-- This is the default in Nvim 0.7+
		debounce_text_changes = 150,
	}

	lspconfig["sumneko_lua"].setup {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = {'vim'},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}

	lspconfig["rust_analyzer"].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}

	lspconfig["clangd"].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}

	lspconfig["cmake"].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}

	lspconfig["bashls"].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}

	lspconfig["jdtls"].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		-- handlers = handlers,
		flags = lsp_flags
	}
