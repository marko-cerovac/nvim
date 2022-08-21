-- Enable mouse
vim.opt.mouse = "a"

-- Cursor effect
vim.g.neovide_cursor_vfx_mode = "sonicboom"

-- Font and cursor options
-- vim.o.guicursor = vim.o.guicursor .. ",a:Cursor/Cursor"
vim.opt.guifont = "Hasklug Nerd Font:h7.5"

-- Disable transparant floating windows
-- vim.g.neovide_floating_blur = false
vim.g.neovide_floating_opacity = 1.0

-- Enable system clipboard
vim.keymap.set('', "<M-p>", '"+p')
vim.keymap.set('v', "<M-y>", '*y')
