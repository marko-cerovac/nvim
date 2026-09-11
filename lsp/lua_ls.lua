return {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            -- workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file("", true),
            -- },
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
