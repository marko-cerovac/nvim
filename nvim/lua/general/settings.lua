--  [ Marko Cerovac | NeoVim | general settings ]
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

vim.o.hidden = true
vim.o.swapfile = false
vim.o.errorbells = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.encoding = "UTF-8"
vim.o.clipboard = "unnamedplus"

vim.o.smarttab = true
vim.bo.expandtab = true
vim.cmd('set ts=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shortmess+=c')
vim.cmd('set iskeyword+=-')

vim.cmd('set shiftwidth=4')
vim.bo.smartindent = true
vim.o.autoindent = true
vim.o.smartcase = true

vim.cmd('set colorcolumn=9999')
vim.wo.number = true
vim.wo.wrap = false
vim.wo.cursorline = true
vim.o.incsearch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 300
vim.o.timeoutlen = 1000

vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.guifont = "Sauce Code Pro Nerd Font"
vim.o.pumheight = 10
