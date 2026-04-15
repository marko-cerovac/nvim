-- enable mouse
vim.opt.mouse = "a"

-- cursor effect
-- vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.6

-- fix the distracting ripple in insert mode
-- github issue:
-- https://github.com/neovide/neovide/issues/3088
-- vim.api.nvim_create_autocmd("ModeChanged", {
--     callback = function(args)
--         local from_mode, to_mode = args.match:match("([^:]+):([^:]+)")
--         if to_mode ~= "i" then
--             vim.g.neovide_cursor_vfx_mode = "ripple"
--         else
--             vim.g.neovide_cursor_vfx_mode = ""
--         end
--     end,
-- })

-- add padding
vim.g.neovide_padding_top = 16
vim.g.neovide_padding_bottom = 16
vim.g.neovide_padding_right = 16
vim.g.neovide_padding_left = 16


-- gamma and opacity
vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.8

-- font and cursor options
vim.opt.guifont = "Hasklug Nerd Font:h16"
-- vim.opt.guifont = "hasklug nerd font:h16:w1"

-- disable transparant floating windows
-- vim.g.neovide_floating_opacity = 1.0

-- hide the mouse
-- vim.g.neovide_hide_mouse_when_typing = true

-- enable system clipboard
vim.keymap.set({"n", "c"}, "<m-p>", '"+p', {})
vim.keymap.set({"n", "c"}, "<C-S-v>", '"+p', {})
-- vim.keymap.set("v", "<m-y>", "*y", {})
