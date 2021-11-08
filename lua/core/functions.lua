local functions = {}

functions.map = function (mode, keymap, action)
	vim.api.nvim_set_keymap(mode, keymap, action, { noremap = true, silent = true })
end

functions.number = function ()
	if vim.wo.number == true then
		vim.wo.number = false
	else
		vim.wo.number = true
	end
end

functions.relative_number = function ()
	if vim.wo.relativenumber == true then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end

functions.cursor_line = function ()
	if vim.wo.cursorline == true then
		vim.wo.cursorline = false
	else
		vim.wo.cursorline = true
	end
end

functions.mouse = function ()
	if vim.o.mouse == "a" then
		vim.o.mouse = ""
	else
		vim.o.mouse = "a"
	end
end

functions.zathura_open_pdf = function ()
	local file_name = string.gsub(vim.api.nvim_buf_get_name(0), "[.]tex", ".pdf")
	vim.api.nvim_command("silent !zathura " .. file_name .. " &")
	return file_name
end

functions.load_telescope = function (command)
	vim.cmd'PackerLoad telescope.nvim'
	vim.cmd(command)
end

return functions
