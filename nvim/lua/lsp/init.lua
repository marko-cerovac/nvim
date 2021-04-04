--  [ Marko Cerovac | NeoVim | LSP settings ]
--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--

local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(client, bufnr)

    --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
	vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true, silent = true})
	--vim.api.nvim_set_keymap('n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n','<C-f>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n','<C-b>', [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', 'gh', [[<Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '<Leader>cp', [[<Cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '<leader>ca', [[<Cmd><cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('v', '<leader>ca', [[<Cmd><C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', 'gs', [[<Cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '<Leader>cr', [[<Cmd>lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '<Leader>cd', [[<Cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '[e', [[<Cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnistic_prev()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', ']e', [[<Cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('n', '<Leader>tf', [[<Cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>]], { noremap = true, silent = true })
	--vim.api.nvim_set_keymap('t', '<C-q>', [[<Cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>]], { noremap = true, silent = true })
    --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --buf_set_keymap('n', '<C-e>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        --buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	    vim.api.nvim_set_keymap('n', '<Leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true})
    elseif client.resolved_capabilities.document_range_formatting then
        --buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	    vim.api.nvim_set_keymap('n', '<Leader>f', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', { noremap = true, silent = true})
    end

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

-- Enable LSP sippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
    "pyright",
    "tsserver",
    "clangd",
    "bashls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
      capabilities = capabilities;
      on_attach = on_attach;
  }
end

-- Lsp icons
vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = " ", numhl = "LspDiagnosticsSignHint"})
