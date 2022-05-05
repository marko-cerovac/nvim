local functions = {}

functions.cursor_line = function ()
	if vim.wo.cursorlineopt == "both" then
		vim.wo.cursorlineopt = "number"
	else
		vim.wo.cursorlineopt = "both"
	end
end

functions.mouse = function ()
	if vim.o.mouse == 'a' then
		vim.o.mouse = ''
	else
		vim.o.mouse = 'a'
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
	vim.cmd "make"
end

functions.run_code = function ()
	-- if the executable path is unknown, prompt the user
	if vim.g.autorun_executable == nil or vim.g.autorun_executable == 0 then
		vim.ui.input(
			{
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file_in_path"
			},
			function (input)
				vim.g.autorun_executable = input
			end
		)
		if vim.g.autorun_executable == '' then
			vim.g.autorun_executable = nil
			return
		end
	end

	-- if the terminal split is unknown, prompt the user
	if vim.g.autorun_term_variant == nil or vim.g.autorun_term_variant == 0 then
		vim.ui.input(
			{
				prompt = "Input terminal variant [ v | s | t | c ]: ",
			},
			function (input)
				vim.g.autorun_term_variant = input
			end
		)
	end
	if vim.g.autorun_term_variant == 's' then
		vim.cmd("split new")
	elseif vim.g.autorun_term_variant == 't' then
		vim.cmd("tab new")
	elseif vim.g.autorun_term_variant == 'c' then
		vim.g.autorun_term_variant = ''
	else
		vim.cmd("vertical new")
	end
	vim.cmd("terminal " .. vim.g.autorun_executable)
end

return functions
