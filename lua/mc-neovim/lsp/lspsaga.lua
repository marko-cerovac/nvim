local saga = require("lspsaga")

saga.init_lsp_saga({
	border_style = vim.g.border_style,
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	show_diagnostic_source = true,
	code_action_icon = " ",
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = false,
	},
	-- separator in finder
	-- finder_separator = "  ",
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_quit = "<C-c>",
	definition_preview_icon = "  ",
	symbol_in_winbar = {
		in_custom = true,
		enable = true,
		-- separator = ' ',
		separator = '  ',
		show_file = true,
		click_support = false,
	},
})

--[[ local function get_file_name(include_path)
    local file_name = require('lspsaga.symbolwinbar').get_file_name()
    if vim.fn.bufname '%' == '' then return '' end
    if include_path == false then return file_name end
    local sep = '/'
    -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
    local path_list = vim.split(vim.fn.expand '%:~:.:h', sep)
    local file_path = ''
    for _, cur in ipairs(path_list) do
      file_path = (cur == '.' or cur == '~') and '' or
                    file_path .. cur .. ' ' .. '%#LspSagaWinbarSep#>%*' .. ' %*'
    end
    return file_path .. file_name
end

local function config_winbar()
    local ok, lspsaga = pcall(require, 'lspsaga.symbolwinbar')
    local sym
    if ok then sym = lspsaga.get_symbol_node() end
    local win_val = ''
    win_val = get_file_name(false) -- set to true to include path
    if sym ~= nil then win_val = win_val .. sym end
    vim.wo.winbar = win_val
end

local events = { 'CursorHold', 'BufEnter', 'BufWinEnter', 'CursorMoved', 'WinLeave', 'User LspasgaUpdateSymbol' }

local exclude = {
    ['teminal'] = true,
    ['prompt'] = true
}

vim.api.nvim_create_autocmd(events, {
    pattern = '*',
    callback = function()
        -- Ignore float windows and exclude filetype
        if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
            vim.wo.winbar = ''
        else
            config_winbar()
        end
    end,
}) ]]
