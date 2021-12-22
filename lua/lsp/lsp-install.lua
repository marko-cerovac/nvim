local lsp_installer = require("nvim-lsp-installer")
local lsp_config = require('lsp.lsp-config')

lsp_installer.on_server_ready(function(server)
    local opts = {
		on_attach = lsp_config.on_attach,
		capabilities = lsp_config.capabilities
	}

	if server.name == 'clangd' then
		opts.root_dir = require('lspconfig.util').root_pattern(
			'compile_commands.json',
			'compile_flags.txt',
			'.git',
			'Makefile',
			'makefile',
			'CMakeLists.txt'
		)
	end

    server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
