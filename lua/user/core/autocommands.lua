-- Open terminal in insert mode
local terminal_group = vim.api.nvim_create_augroup("Terminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", { callback = function ()
		vim.opt.number = false
		vim.opt.relativenumber = false
		vim.opt.cursorline = false
		vim.cmd "startinsert"
	end,
	group = terminal_group
})
