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

    return string.format('%%#%s# %s %%#StatusLine# %s', icon_hl, icon, fname)

end

local function git()
    local git_info = vim.b.gitsigns_status_dict


end

Statusline = {}

Statusline.active = function()
    return table.concat {
        '%#StatusLine#',
        mode(),
        '%#StatusLine#',
        -- '  ',
        filename(),
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

-- cmdgeight=0 option has a glitch where the statusline
-- doesn't render on modes other than Normal mode.
-- this is a fix.
vim.api.nvim_create_autocmd('ModeChanged', {
    group = vim.api.nvim_create_augroup('user.statusline', { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.cmd 'redrawstatus'
        end)
    end
})

-- ############## RESOURCES ###############
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

-- IDEA:
-- have a red recording button ( or )
-- to denote that a macro is being recorded
-- literature:
-- https://www.reddit.com/r/neovim/comments/1djkwif/show_recording_macros_message_in_ministatusline/
