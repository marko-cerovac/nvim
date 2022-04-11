-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local options = { noremap=true, silent=true, buffer = true }

	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, options)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, options)
	-- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, options)
	vim.keymap.set("n", "<leader>cwa", function() vim.lsp.buf.add_workspace_folder() end, options)
	vim.keymap.set("n", "<leader>cwx", function() vim.lsp.buf.remove_workspace_folder() end, options)
	vim.keymap.set("n", "<leader>cwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, options)
	vim.keymap.set("n", "<leader>ct", function() vim.lsp.buf.type_definition() end, options)
	vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.formatting() end, options)
	vim.keymap.set("v", "<leader>cf", function() vim.lsp.buf.range_formatting() end, options)

	vim.keymap.set("n", "K", function () return require('lspsaga.hover').render_hover_doc() end, options)
	vim.keymap.set("n", "<leader>ch", function () return require("lspsaga.provider").lsp_finder() end, options)
	vim.keymap.set("n", "<leader>cr", function () return require('lspsaga.rename').rename() end, options)
	vim.keymap.set("n", "<leader>ca", function () return require('lspsaga.codeaction').code_action() end, options)
	vim.keymap.set("v", "<leader>ca", function () return require('lspsaga.codeaction').range_code_action() end, options)
	vim.keymap.set("n", "<leader>cs", function () return require('lspsaga.signaturehelp').signature_help() end, options)
	vim.keymap.set("n", "<leader>cp", function () return require('lspsaga.provider').preview_definition() end, options)
	vim.keymap.set("n", "<leader>cl", function () return require('lspsaga.diagnostic').show_line_diagnostics() end, options)
	vim.keymap.set("n", "<leader>cL", function () return require('lspsaga.diagnostic').show_cursor_diagnostics() end, options)
	vim.keymap.set("n", "[c", "<cmd>Lspsaga diagnostic_jump_next<CR>", options)
	vim.keymap.set("n", "]c", "<cmd>Lspsaga diagnostic_jump_prev<CR>", options)
	vim.keymap.set("n", "<C-u>", function() return require('lspsaga.action').smart_scroll_with_saga(-1) end, options)
	vim.keymap.set("n", "<C-d>", function() return require('lspsaga.action').smart_scroll_with_saga(1) end, options)

	-- Rounded hover borders
	vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})
	vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "●", -- Could be "", "▎", "x"
		}
	})

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			 augroup lsp_document_highlight
			   autocmd! * <buffer>
			   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			 augroup END
		]], false)
	end

end

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

-- Define signs
-- vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "LspDiagnosticsSignError", numhl = ""})
-- vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "LspDiagnosticsSignWarning", numhl = ""})
-- vim.fn.sign_define("DiagnosticSignHint", {text = " ", texthl = "LspDiagnosticsSignHint", numhl = ""})
-- vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "LspDiagnosticsSignInformation", numhl = ""})

return {
	-- Enable code snippets
	capabilities = capabilities,
	-- map buffer local bindings
	on_attach = on_attach
}
