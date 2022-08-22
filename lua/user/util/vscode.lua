local map = vim.keymap.set
local opts = { silent = true }

-- Open which-key
map("n", "<Space>", ":call VSCodeNotify('whichkey.show')<CR>", opts)
map("x", "<Space>", ":<C-u>call <SID>openWhichKeyInVisualMode()<CR>", opts)

-- Escaping insert mode
-- map("i", "fj", "<Esc>", opts)
-- map("i", "jf", "<Esc>", opts)
-- map("i", "kj", "<Esc>", opts)

-- Window Navigation
-- map("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
-- map("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
-- map("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
-- map("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
-- map("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
-- map("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
-- map("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)
-- map("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)

-- Tab navigation
-- map("n", "<Tab>", ":Tabnext<CR>", opts)
-- map("n", "<S-Tab>", ":Tabprev<CR>", opts)
