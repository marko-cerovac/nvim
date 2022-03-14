vim.opt.hidden = true										-- hidden buffers
vim.opt.swapfile = false									-- swap files
vim.opt.errorbells = false                            		-- error sound
vim.opt.backup = false                                		-- backup file
vim.opt.writebackup = false                           		-- writing backup file
vim.opt.autochdir = true                              		-- change directory
vim.opt.encoding = "UTF-8"                            		-- encoding
vim.opt.clipboard = "unnamedplus"                     		-- clipboard

vim.opt.smarttab = true                               		-- smart tabs
vim.opt.expandtab = false                            		-- expand tabs to spaces
vim.opt.tabstop = 4											-- tab stop
-- vim.opt.softtabstop = 0										-- soft tab stop
vim.opt.shiftwidth = 4										-- shift width
vim.opt.smartindent = true                           		-- smart indenting
vim.opt.autoindent = true                             		-- auto indenting
vim.opt.smartcase = true                              		-- search smart case

vim.opt.colorcolumn = "999"									-- color column
vim.opt.number = true                                		-- line numbers
vim.opt.relativenumber = true                        		-- relative line numbers
vim.opt.wrap = false                                 		-- word wrapping
vim.opt.cursorline = true                            		-- cursor line
-- vim.opt.cursorlineopt = "number"							-- set cursorline style
vim.opt.incsearch = true                              		-- incremental search
vim.opt.splitright = true                             		-- split vertical windows right
vim.opt.splitbelow = true                             		-- split horizontal windows below
vim.opt.updatetime = 250                              		-- update time
vim.opt.timeoutlen = 300                              		-- timeout length
vim.opt.showmode = false                              		-- mode message
vim.opt.mouse = "a"                                   		-- mouse
vim.opt.foldenable = false									-- disable auto folding
vim.opt.foldmethod = "expr"									-- folding method

vim.opt.termguicolors = true                          		-- gui colors
vim.opt.background = "dark"                           		-- background color
vim.opt.completeopt = "menuone,noselect"              		-- completion options
vim.opt.pumheight = 10                                		-- popup menu height
-- vim.opt.guicursor:append(",a:Cursor/Cursor")				-- color cursor output
vim.opt.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"


-- Open terminal in insert mode
local terminal_group = vim.api.nvim_create_augroup("Terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { callback = function ()
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.cursorline = false
	vim.cmd 'startinsert'
end, group = terminal_group })

-- Disable built-in plugins
-- local built_ins = {
-- 	"netrw",
-- 	"netrwPlugin",
-- 	"netrwSettings",
-- 	"netrwFileHandlers",
-- 	"gzip",
-- 	"zip",
-- 	"zipPlugin",
-- 	"tar",
-- 	"tarPlugin",
-- 	"getscript",
-- 	"getscriptPlugin",
-- 	"vimball",
-- 	"vimballPlugin",
-- 	"2html_plugin",
-- 	"logipat",
-- 	"rrhelper",
-- 	"spellfile_plugin",
-- 	"matchit"
-- }
-- for _,plugin in pairs(built_ins) do
-- 	vim.g["loaded_" .. plugin] = 1
-- end
