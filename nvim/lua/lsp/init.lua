--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: lsp/init.lua
--       \/__/         \/__/       Desc: language server protocol settings


local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Mappings.

-- Go to commands
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', [[:lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', [[:lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap = true, silent = true })

-- Diagnostics
vim.api.nvim_set_keymap("n", '<leader>cd', "<cmd>LspTroubleToggle<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cl', [[:lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[c', [[:lua require'lspsaga.diagnostic'.lsp_jump_diagnistic_prev()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']c', [[:lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true })

-- Hover
vim.api.nvim_set_keymap('n', 'K', [[:lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cp', [[:lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-f>', [[:lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-b>', [[:lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })

-- Code action
vim.api.nvim_set_keymap('n', '<leader>ca', [[:<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ca', [[:<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], { noremap = true, silent = true })

-- Rename
vim.api.nvim_set_keymap('n', '<Leader>cr', [[:lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })

-- Add to workspace
vim.api.nvim_set_keymap('n', '<Leader>da', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true, silent = true})

local on_attach = function(client, bufnr)

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

-- Enable LSP snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Initialize language severs in a loop
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
