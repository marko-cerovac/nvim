--  [ Marko Cerovac | NeoVim | bash lsp settings ]
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

require'lspconfig'.clangd.setup{
	on_attach = require'lsp'.on_attach();
	capabilities = require'lsp'.capabilities();
}

--  Commands:
--  ClangdSwitchSourceHeader: Switch between source/header
--
--  Default Values:
--    capabilities = default capabilities, with offsetEncoding utf-8
--    cmd = { "clangd", "--background-index" }
--    filetypes = { "c", "cpp", "objc", "objcpp" }
--    on_init = function to handle changing offsetEncoding
--    root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname
