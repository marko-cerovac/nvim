-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    --Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local options = { noremap=true, silent=true }

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", options)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", options)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
    buf_set_keymap("n", "<leader>cwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", options)
    buf_set_keymap("n", "<leader>cwx", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", options)
    buf_set_keymap("n", "<leader>cwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", options)
    buf_set_keymap("n", "<leader>ct", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
    buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
    buf_set_keymap("v", "<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", options)

	buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", options)
	buf_set_keymap("n", "<leader>ch", "<cmd>Lspsaga lsp_finder<CR>", options)
	buf_set_keymap("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", options)
	buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", options)
	buf_set_keymap("x", "<leader>ca", ":<c-u>Lspsaga range_code_action<CR>", options)
	buf_set_keymap("n", "<leader>cs", "<cmd>Lspsaga signature_help<CR>", options)
	buf_set_keymap("n", "<leader>cp", "<cmd>Lspsaga preview_definition<CR>", options)
	buf_set_keymap("n", "<leader>cl", "<cmd>Lspsaga show_line_diagnostics<CR>", options)
	buf_set_keymap("n", "[c", "<cmd>Lspsaga diagnostic_jump_prev<CR>", options)
	buf_set_keymap("n", "]c", "<cmd>Lspsaga diagnostic_jump_next<CR>", options)
	buf_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", options)
	buf_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", options)
	buf_set_keymap("n", "<leader>tf", "<cmd>Lspsaga open_floterm<CR>", options)
	buf_set_keymap("n", "<leader>tq", "<cmd>Lspsaga close_floterm<CR>", options)

    -- buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", options)
    -- buf_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    -- buf_set_keymap("n", "<leader>cq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", options)
    -- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
    -- buf_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border="rounded"})<CR>", options)
    -- buf_set_keymap("n", "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
    -- buf_set_keymap("n", "[c", "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={border="rounded"}})<CR>", options)
    -- buf_set_keymap("n", "]c", "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={border="rounded"}})<CR>", options)

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


-- Use a loop to conveniently call "setup" on multiple servers and
-- map buffer local keybindings when the language server attaches
--[[ local servers = {
	"pyright",
	"tsserver",
	"clangd",
	"bashls",
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end ]]

return {
	-- Enable code snippets
	capabilities = capabilities,
	-- map buffer local bindings
	on_attach = on_attach
}
