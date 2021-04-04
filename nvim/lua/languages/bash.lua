--  [ Marko Cerovac | NeoVim | clang lsp settings ]
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

require'lspconfig'.bashls.setup{
    on_attach = require('lsp').on_attach;
    capabilities = require('lsp').capabilities;
}

--  Commands:
--
--  Default Values:
--    cmd = { "bash-language-server", "start" }
--    cmd_env = {
--      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
--    }
--    filetypes = { "sh" }
--    root_dir = vim's starting directory
