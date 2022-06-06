vim.opt.swapfile = false									-- swap files
vim.opt.writebackup = false                           		-- writing backup file
vim.opt.autochdir = true                              		-- change directory
-- vim.opt.encoding = "UTF-8"                            		-- encoding
vim.opt.clipboard = "unnamedplus"                     		-- clipboard

vim.opt.tabstop = 4											-- tab stop
vim.opt.shiftwidth = 4										-- shift width
vim.opt.smartindent = true                           		-- smart indenting
vim.opt.smartcase = true                              		-- search smart case

vim.opt.signcolumn = "yes" 									-- sign column
vim.opt.number = true                                		-- line numbers
vim.opt.relativenumber = true                        		-- relative line numbers
vim.opt.wrap = false                                 		-- word wrapping
vim.opt.cursorline = true                            		-- cursor line
-- vim.opt.laststatus = 3 										-- global statusline
-- vim.opt.cursorlineopt = "number"							-- set cursorline style
vim.opt.splitright = true                             		-- split vertical windows right
vim.opt.splitbelow = true                             		-- split horizontal windows below
vim.opt.updatetime = 250                              		-- update time
vim.opt.timeoutlen = 300                              		-- timeout length
vim.opt.showmode = false                              		-- mode message
-- vim.opt.mouse = "a"                                   		-- mouse
vim.opt.foldenable = false									-- disable auto folding
vim.opt.foldmethod = "expr"									-- folding method

vim.opt.termguicolors = true                          		-- gui colors
vim.opt.completeopt = "menuone,noselect"              		-- completion options
vim.opt.pumheight = 10                                		-- popup menu height
-- vim.opt.guicursor:append(",a:Cursor/Cursor")				-- color cursor output
vim.opt.listchars = "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
-- vim.o.guicursor = vim.o.guicursor .. ",a:Cursor/Cursor"

vim.g.border_style = "rounded" 								-- floating window border style

-- Open terminal in insert mode
local terminal_group = vim.api.nvim_create_augroup("Terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { callback = function ()
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.opt.cursorline = false
	vim.cmd 'startinsert'
end, group = terminal_group })
