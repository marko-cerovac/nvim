local functions = {}

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
	if vim.wo.cursorlineopt == "both" then
		vim.wo.cursorlineopt = "number"
	else
		vim.wo.cursorlineopt = "both"
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

functions.build_system = function ()
	if vim.g.auto_build_command_selected ~= 1 then
		local build_command = vim.fn.input("Input build command: ", "", "shellcmd")
		if build_command == "" then
			build_command = "make"
		end
		vim.o.makeprg = build_command
		vim.g.auto_build_command_selected = 1
	end
	vim.cmd 'make'
end

functions.run_code = function ()
	-- if the executable path is unknown, prompt the user
	if vim.g.autorun_executable == nil or vim.g.autorun_executable == 0 then
		vim.g.autorun_executable = vim.fn.input("Input executable to autorun: ", vim.fn.getcwd() .. "/", "file_in_path")
		if vim.g.autorun_executable == "" then
			vim.g.autorun_executable = nil
			return
		end
	end

	-- if the terminal split is unknown, prompt the user
	if vim.g.autorun_term_variant == nil or vim.g.autorun_term_variant == 0 then
		vim.g.autorun_term_variant = vim.fn.input("Input terminal variant [ v | s | t ]: ")
		if vim.g.autorun_term_variant == "s" then
			vim.g.autorun_term_variant = "split"
		elseif vim.g.autorun_term_variant == "t" then
			vim.g.autorun_term_variant = "tab"
		else
			vim.g.autorun_term_variant = "vertical"
		end
	end
	vim.cmd(vim.g.autorun_term_variant .. ' new')
	vim.cmd 'terminal'
	local command = vim.api.nvim_replace_termcodes("<C-l>" .. vim.g.autorun_executable .. "<CR>", true, true, true)
	vim.api.nvim_feedkeys(command, 'n', true)
end

return functions
