--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: functions.lua
--       \/__/         \/__/       Desc: global functions


local toggle = {
    number = function ()
        if vim.wo.number == true then
            vim.wo.number = false
        else
            vim.wo.number = true
        end
    end,

    relative_number = function ()
        if vim.wo.relativenumber == true then
            vim.wo.relativenumber = false
        else
            vim.wo.relativenumber = true
        end
    end,

    cursor_line = function ()
        if vim.wo.cursorline == true then
            vim.wo.cursorline = false
        else
            vim.wo.cursorline = true
        end
    end
}

return toggle
