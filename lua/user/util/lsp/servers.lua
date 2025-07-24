local lsp = require 'lspconfig'
local capabilities = require('blink.cmp').get_lsp_capabilities()

local home_dir = vim.env.HOME

lsp.sqls.setup {
    capabilities = capabilities
}

lsp.clangd.setup {
    capabilities = capabilities
}

lsp.nushell.setup {
    capabilities = capabilities
}

lsp.basedpyright.setup {
    capabilities = capabilities
}

lsp.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- lsp.jdtls.setup {
--     capabilities = capabilities,
--     cmd = {
--         'jdtls',
--         '-configuration',
--         home_dir .. '/.cache/jdtls/config',
--         '-data',
--         home_dir .. '/.cache/jdtls/workspace',
--     },
--     init_options = {
--         jvm_args = {},
--         workspace = home_dir .. '/.cache/jdtls/workspace'
--     }
-- }

lsp.tinymist.setup {
    capabilities = capabilities,
}

-- lsp.rust_analyzer.setup {
--     capabilities = capabilities,
--     settings = {
--         ['rust-analyzer'] = {
--             checkOnSave = {
--                 -- command = 'check'
--                 command = 'clippy'
--             },
--             imports = {
--                 granularity = {
--                     group = 'module',
--                 },
--                 prefix = 'self',
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--             },
--             procMacro = {
--                 enable = true,
--             },
--         }
--     }
-- }
