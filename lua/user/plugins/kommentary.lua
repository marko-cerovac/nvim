local map = vim.keymap.set

-- require("kommentary.config").configure_language("default", {
--     prefer_single_line_comments = true,
-- })

map("n", "<Leader>k", "<Plug>kommentary_line_default", {})
map("x", "<Leader>k", "<Plug>kommentary_visual_default", {})
map("n", "<Leader>/", "<Plug>kommentary_motion_default", {})
