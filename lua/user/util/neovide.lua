-- enable mouse
vim.opt.mouse = "a"

-- cursor effect
vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.6

-- font and cursor options
vim.opt.guifont = "hasklug nerd font:h15"

-- disable transparant floating windows
-- vim.g.neovide_floating_blur = false
vim.g.neovide_floating_opacity = 1.0

-- hide the mouse
vim.g.neovide_hide_mouse_when_typing = true

-- enable system clipboard
vim.keymap.set({"n", "c"}, "<m-p>", '"+p', {})
vim.keymap.set({"n", "c"}, "<C-S-v>", '"+p', {})
-- vim.keymap.set("v", "<m-y>", "*y", {})
