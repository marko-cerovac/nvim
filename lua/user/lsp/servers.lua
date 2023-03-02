local lspconfig   = require "lspconfig"
local user_config = require "user.lsp.config"

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup {
            on_attach    = user_config.on_attach,
            capabilities = user_config.capabilities
        }
    end,
    --[[ ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup {
            on_attach = user_config.on_attach,
            capabilities = user_config.capabilities,
            settings = {
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
            }
        }
    end, ]]
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
            on_attach = user_config.on_attach,
            capabilities = user_config.capabilities,
        }
    end,
})
