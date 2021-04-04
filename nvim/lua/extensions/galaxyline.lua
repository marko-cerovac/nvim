--  [ Marko Cerovac | NeoVim | galaxy line settings ]
--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--

vim.cmd [[packadd galaxyline.nvim]]
local gl = require('galaxyline')
local colors = require('modules/colors/material')

local gls = gl.section
gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree'}


-- Local helper functions

function is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

local buffer_not_empty = function() return not is_buffer_empty() end

local checkwidth = function()
    return has_width_gt(35) and buffer_not_empty()
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value[1] == val then return true end
    end
    return false
end

local mode_color = function()
    local mode_colors = {
        [110] = colors.cyan,    --Normal mode
        [105] = colors.green,   --Insert mode
        [99] = colors.blue,     --Command mode
        [116] = colors.blue,    --Terminal mode
        [118] = colors.purple,  --Visual mode
        [22] = colors.purple,   --V-block mode
        [86] = colors.purple,   --V-line mode
        [82] = colors.red1,     --Replace mode
        [115] = colors.red1,    --Select mode
        [83] = colors.red1      --S-line mode
    }

    mode_color = mode_colors[vim.fn.mode():byte()]
    if mode_color ~= nil then
        return mode_color
    else
        return colors.purple
    end
end

local function file_readonly()
    if vim.bo.filetype == 'help' then return '' end
    if vim.bo.readonly == true then return '  ' end
    return ''
end

local function get_current_file_name()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
    if vim.bo.modifiable then
        if vim.bo.modified then return file .. '  ' end
    end
    return file .. ' '
end

 local function trailing_whitespace()
     local trail = vim.fn.search('\\s$', 'nw')
     if trail ~= 0 then
         return '  '
     else
         return nil
     end
 end

-- local function tab_indent()
--     local tab = vim.fn.search('^\\t', 'nw')
--     if tab ~= 0 then
--         return ' → '
--     else
--         return nil
--     end
-- end

-- local function buffers_count()
--     local buffers = {}
--     for _, val in ipairs(vim.fn.range(1, vim.fn.bufnr('$'))) do
--         if vim.fn.bufexists(val) == 1 and vim.fn.buflisted(val) == 1 then
--             table.insert(buffers, val)
--         end
--     end
--     return #buffers
-- end

local function get_basename(file) return file:match("^.+/(.+)$") end

local GetGitRoot = function()
    local git_dir = require('galaxyline.provider_vcs').get_git_dir()
    if not git_dir then return '' end

    local git_root = git_dir:gsub('/.git/?$', '')
    return get_basename(git_root)
end

-- Left side
gls.left[1] = {
    ViMode = {
        provider = function()
            local aliases = {
                [110] = 'NORMAL',
                [105] = 'INSERT',
                [99] = 'COMMAND',
                [116] = 'TERMINAL',
                [118] = 'VISUAL',
                [22] = 'V-BLOCK',
                [86] = 'V-LINE',
                [82] = 'REPLACE',
                [115] = 'SELECT',
                [83] = 'S-LINE'
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
            alias = aliases[vim.fn.mode():byte()]
            if alias ~= nil then
                if has_width_gt(35) then
                    mode = alias
                else
                    mode = alias:sub(1, 1)
                end
            else
                mode = vim.fn.mode():byte()
            end
            return '  ' .. mode .. ' '
        end,
        --separator = '',
        --separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.bg, colors.bg, 'bold'}
    }
}
gls.left[2] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon,
            colors.section_bg
        }
    }
}
gls.left[3] = {
    FileName = {
        provider = get_current_file_name,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}
 gls.left[4] = {
     WhiteSpace = {
         provider = trailing_whitespace,
         condition = buffer_not_empty,
         highlight = {colors.fg, colors.bg}
     }
 }
-- gls.left[5] = {
--     TabIndent = {
--         provider = tab_indent,
--         condition = buffer_not_empty,
--         highlight = {colors.fg, colors.bg}
--     }
-- }
gls.left[9] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red1, colors.bg}
    }
}
gls.left[10] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange, colors.bg}
    }
}
gls.left[12] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.section_bg},
        separator = ' ',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

-- Right side
gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '+',
        highlight = {colors.green, colors.bg}
    }
}
gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = '~',
        highlight = {colors.orange, colors.bg}
    }
}
gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '-',
        highlight = {colors.red1, colors.bg}
    }
}
gls.right[4] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.right[5] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = buffer_not_empty and
            require('galaxyline.condition').check_git_workspace,
        highlight = {colors.middlegrey, colors.bg}
    }
}
gls.right[6] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = buffer_not_empty,
        highlight = {colors.middlegrey, colors.bg}
    }
}
gls.right[7] = {
    GitRoot = {
        provider = {
            function() return '  ' end, GetGitRoot, function()
                return ' '
            end
        },
        condition = buffer_not_empty and
            require('galaxyline.condition').check_git_workspace,
        highlight = {colors.middlegrey, colors.bg}
    }
}
gls.right[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {colors.cyan, colors.bg},
        highlight = {colors.gray2, colors.cyan}
    }
}
 gls.right[9] = {
     ScrollBar = {
         provider = 'ScrollBar',
         highlight = {colors.green, colors.section_bg}
     }
 }

-- Short status line
gls.short_line_left[1] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = function()
            return buffer_not_empty and
                       has_value(gl.short_line_list, vim.bo.filetype)
        end,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon,
            colors.section_bg
        }
    }
}
gls.short_line_left[2] = {
    FileName = {
        provider = get_current_file_name,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.yellow, colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
