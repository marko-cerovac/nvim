local lspconfig = require("lspconfig")
local settings = require("mc-neovim.lsp.lsp-config")

lspconfig["sumenko_lua"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}

lspconfig["rust_analyzer"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}

lspconfig["clangd"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}

lspconfig["cmake"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}

lspconfig["bashls"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}

lspconfig["jdtls"].setup {
	on_attach = settings.on_attach,
	flags = settings.lsp_flags
}
