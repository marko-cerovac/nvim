local lsp_installer = require("nvim-lsp-installer")
local lsp_config = require('lsp.lsp-config')

lsp_installer.on_server_ready(function(server)
    local opts = {
		on_attach = lsp_config.on_attach,
		capabilities = lsp_config.capabilities
	}

    server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
