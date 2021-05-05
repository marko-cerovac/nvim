--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/statusline.lua
--       \/__/         \/__/       Desc: lualine settings


require('lualine').setup{
    options = {
        theme = 'material-nvim',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = { {'branch'}, {'diff'} },
        lualine_c = { {'diagnostics', sources = {'nvim_lsp'}}, {'filename'} },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}

