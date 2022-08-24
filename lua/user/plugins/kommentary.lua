local map = vim.keymap.set

-- require("kommentary.config").configure_language("default", {
--     prefer_single_line_comments = true,
-- })

map("n", "<leader>k", "<Plug>kommentary_line_default", {})
map("x", "<leader>k", "<Plug>kommentary_visual_default", {})
map("n", "<leader>/", "<Plug>kommentary_motion_default", {})
