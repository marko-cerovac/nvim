local lspconfig   = require "lspconfig"
local user_config = require "user.lsp.config"

lspconfig["sumneko_lua"].setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
			--[[ workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			}, ]]
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
}
lspconfig["rust_analyzer"].setup {
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
    --[[ settings = {
        ["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			},
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
    } ]]
}
lspconfig["clangd"].setup {
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
}

lspconfig["cmake"].setup {
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
}

lspconfig["bashls"].setup {
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
}

lspconfig["jdtls"].setup {
    on_attach = user_config.on_attach,
    capabilities = user_config.capabilities,
}
