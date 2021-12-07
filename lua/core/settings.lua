vim.o.hidden = true                                 -- hidden buffers
vim.o.swapfile = false                              -- swap files
vim.o.errorbells = false                            -- error sound
vim.o.backup = false                                -- backup file
vim.o.writebackup = false                           -- writing backup file
vim.o.autochdir = true                              -- change directory
vim.o.encoding = "UTF-8"                            -- encoding
vim.o.clipboard = "unnamedplus"                     -- clipboard

vim.o.smarttab = true                               -- smart tabs
vim.bo.expandtab = false                            -- expand tabs to spaces
vim.o.ts = 4										-- tab stop
vim.o.softtabstop = 4								-- soft tab stop

vim.o.shiftwidth = 4									-- shift width
vim.bo.smartindent = true                           -- smart indenting
vim.o.autoindent = true                             -- auto indenting
vim.o.smartcase = true                              -- search smart case

vim.o.colorcolumn = '999'							-- color column
vim.wo.number = true                                -- line numbers
vim.wo.relativenumber = true                        -- relative line numbers
vim.wo.wrap = false                                 -- word wrapping
vim.wo.cursorline = true                            -- cursor line
vim.o.incsearch = true                              -- incremental search
vim.o.splitright = true                             -- split vertical windows right
vim.o.splitbelow = true                             -- split horizontal windows below
vim.o.updatetime = 250                              -- update time
vim.o.timeoutlen = 300                              -- timeout length
vim.o.showmode = false                              -- mode message
vim.o.mouse = "a"                                   -- mouse
vim.o.foldenable = false							-- disable auto folding
vim.o.foldmethod = "expr"							-- folding method

vim.o.termguicolors = true                          -- gui colors
vim.o.background = "dark"                           -- background color
vim.o.guifont = "Sauce Code Pro Nerd Font:h16"      -- font
-- vim.o.guifont = "Hasklug Nerd Font:h16"
vim.o.completeopt = "menuone,noselect"              -- completion options
vim.o.pumheight = 10                                -- popup menu height

-- Open terminal in insert mode
vim.cmd [[augroup Terminal]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd TermOpen * :set nonumber]]
vim.cmd [[autocmd TermOpen * :set norelativenumber]]
vim.cmd [[autocmd TermOpen * :set nocursorline]]
vim.cmd [[autocmd TermOpen * :normal a]]
vim.cmd [[augroup END]]

-- Disable built-in plugins
local built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}
for _,plugin in pairs(built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
