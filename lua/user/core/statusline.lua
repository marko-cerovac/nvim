local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local modes = {
    ['n']    = { content = 'NORM', hl = 'StatusLineModeNormal' },
    ['v']    = { content = 'VISU', hl = 'StatusLineModeVisual' },
    ['V']    = { content = 'V-LN', hl = 'StatusLineModeVisual' },
    [CTRL_V] = { content = 'V-BL', hl = 'StatusLineModeVisual' },
    ['s']    = { content = 'SELE', hl = 'StatusLineModeVisual' },
    ['S']    = { content = 'S-LN', hl = 'StatusLineModeVisual' },
    [CTRL_S] = { content = 'S-BL', hl = 'StatusLineModeVisual' },
    ['i']    = { content = 'INSE', hl = 'StatusLineModeInsert' },
    ['R']    = { content = 'REPL', hl = 'StatusLineModeReplace' },
    ['c']    = { content = 'COMM', hl = 'StatusLineModeCommand' },
    ['r']    = { content = 'PROM', hl = 'StatusLineModeCommand' },
    ['!']    = { content = 'SHEL', hl = 'StatusLineModeTerminal' },
    ['t']    = { content = 'TERM', hl = 'StatusLineModeTerminal' },
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format('%%#%s# %s ', modes[current_mode].hl, modes[current_mode].content)
end


local function filename()
    local fname = vim.fn.expand '%:t'
    local icon, icon_hl = require('mini.icons').get('file', fname)

    return string.format(' %%#%s#%s %%#StatusLine#%%M%s ', icon_hl, icon, fname)
end

local function git()
    local git_info = vim.b.gitsigns_status_dict

    if not git_info or git_info.head == '' then
        return ''
    end

    local branch = string.format(' 󰘬 %s', git_info.head) or ''
    local added = git_info.added and string.format('%%#GitSignsAdd# +%s ', git_info.added) or ''
    local changed = git_info.changed and string.format('%%#GitSignsChange# ~%s ', git_info.changed) or ''
    local removed = git_info.removed and string.format('%%#GitSignsDelete# -%s ', git_info.removed) or ''

    if git_info.added == 0 then
        added = ''
    end
    if git_info.changed == 0 then
        changed = ''
    end
    if git_info.removed == 0 then
        removed = ''
    end

    return string.format(' %%#Title#%%%s: %s%s%s', branch, added, changed, removed)
end

-- scrap this
-- local lsp_clients = {}
-- local function lsp_client()
--     local bufnr = vim.api.nvim_get_current_buf()
--     if lsp_clients[bufnr] then
--         return string.format('%s', lsp_clients[bufnr])
--     else
--         local result = ''
--         local servers = vim.lsp.get_clients({ bufnr = bufnr })
--         if not vim.tbl_isempty(servers) then
--             for _, server in pairs(servers) do
--                 result = result .. '+' .. server.name
--             end
--         end
--
--         lsp_clients[bufnr] = result:sub(2) .. ':'
--         vim.schedule(function()
--             vim.cmd 'redrawstatus'
--         end)
--     end
-- end

local function diagnostics()
    local bufnr = vim.api.nvim_get_current_buf()
    if not vim.diagnostic.is_enabled({ bufnr = bufnr }) then return '' end

    local error = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR]
    local warn  = vim.diagnostic.count(0)[vim.diagnostic.severity.WARN]
    local info  = vim.diagnostic.count(0)[vim.diagnostic.severity.INFO]
    local hint  = vim.diagnostic.count(0)[vim.diagnostic.severity.HINT]

    if error == nil or error == 0 then error = '' else error = string.format('%%#DiagnosticSignError# %s ', error) end
    if warn == nil or warn == 0 then warn = '' else warn = string.format('%%#DiagnosticSignWarn# %s ', warn) end
    if info == nil or info == 0 then info = '' else info = string.format('%%#DiagnosticSignInfo# %s ', info) end
    if hint == nil or hint == 0 then hint = '' else hint = string.format('%%#DiagnosticSignHint# %s ', hint) end

    local result = string.format(' %s%s%s%s ', error, warn, info, hint)

    if result == '  ' then
        return result
    else
        return string.format('  :%s', result)
    end
end

local function dap()
    if not package.loaded['dap'] then
        return ''
    end

    local status = require('dap').status()

    if status == '' then
        return ''
    end

    return string.format(' %s', status)
end

local function macro_recording()
    local register = vim.fn.reg_recording()

    if register == '' then
        return ''
    else
        return string.format(' %%#StatusLineRecording#󰑊%s ', register)
        -- return string.format('%%#StatusLineRecording#󰑊%%#StatusLine#%s', register)
    end
end

local function visual_selected()

    local ln_beg = vim.fn.line('v')
    local ln_end = vim.fn.line('.')

    local lines = ln_beg <= ln_end and ln_end - ln_beg + 1 or ln_beg - ln_end + 1

    return string.format(' [%sch/%sln]', vim.fn.wordcount().visual_chars, lines)
end

local function position()
    if vim.fn.mode():find('[vV]') then
        return visual_selected()
    end

    local line_count = vim.fn.line('$')

    if line_count < 20 then
        return ''
    else
        return ' 󱪶 %l/%L[%p%%] '
    end
end

Statusline = {}

Statusline.active = function()
    return table.concat {
        '%#StatusLine#',
        mode(),
        macro_recording(),
        '%#StatusLine#',
        -- '%=%=',
        git(),
        '%=%=',
        '%#StatusLine#',
        -- lsp_client(),
        diagnostics(),
        '%#StatusLine#',
        dap(),
        '%=%=',
        -- '  ',
        '%=',
        filename(),
        position(),
    }
end

Statusline.inactive = function()
    return table.concat {
        '%#StatusLineNC#',
        '%F',
    }
end

vim.go.statusline =
'%{%(nvim_get_current_win()==#g:actual_curwin || &laststatus==3) ? v:lua.Statusline.active() : v:lua.Statusline.inactive()%}'


vim.api.nvim_create_autocmd('DiagnosticChanged', {
    group = vim.api.nvim_create_augroup('user.statusline', { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.cmd 'redrawstatus'
        end)
    end
})

-- cmdgeight=0 option has a glitch where the statusline
-- doesn't render on modes other than Normal mode.
-- this is a fix.
-- vim.api.nvim_create_autocmd('ModeChanged', {
--     group = vim.api.nvim_create_augroup('user.statusline', { clear = true }),
--     callback = function()
--         vim.schedule(function()
--             vim.cmd 'redrawstatus'
--         end)
--     end
-- })

-- ############## RESOURCES ###############
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
