-- Enable mouse
vim.opt.mouse = "a"

-- Cursor effect
vim.g.neovide_cursor_vfx_mode = "sonicboom"

-- Font and cursor options
-- vim.o.guicursor = vim.o.guicursor .. ",a:Cursor/Cursor"
vim.opt.guifont = "Hasklug Nerd Font:h7.5"
-- vim.g.neovide_transparency = 0.9

-- Enable system clipboard
vim.keymap.set('', "<M-p>", '"+p')
vim.keymap.set('v', "<M-y>", '*y')
