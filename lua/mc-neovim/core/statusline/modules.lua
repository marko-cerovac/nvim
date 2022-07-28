-- CURRENTLY UNSUED
-- WORK IN PROGRESS
local fn = vim.fn
local separators = require("mc-neovim.core.statusline.icons").statusline_separators.block
local left_separator = separators["left"]
local right_separator = separators["right"]

local modes = {
  ["n"] = { "NORMAL", "NormalMode" },
  ["niI"] = { "NORMAL i", "NormalMode" },
  ["niR"] = { "NORMAL r", "NormalMode" },
  ["niV"] = { "NORMAL v", "NormalMode" },
  ["no"] = { "N-PENDING", "NormalMode" },
  ["i"] = { "INSERT", "InsertMode" },
  ["ic"] = { "INSERT", "InsertMode" },
  ["ix"] = { "INSERT completion", "InsertMode" },
  ["t"] = { "TERMINAL", "ModeMsg" },
  ["nt"] = { "NTERMINAL", "Title" },
  ["v"] = { "VISUAL", "VisualMode" },
  ["V"] = { "V-LINE", "VisualMode" },
  [""] = { "V-BLOCK", "VisualMode" },
  ["R"] = { "REPLACE", "ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "ReplaceMode" },
  ["s"] = { "SELECT", "Function" },
  ["S"] = { "S-LINE", "Function" },
  [""] = { "S-BLOCK", "Function" },
  ["c"] = { "COMMAND", "CommandMode" },
  ["cv"] = { "COMMAND", "CommandMode" },
  ["ce"] = { "COMMAND", "CommandMode" },
  ["r"] = { "PROMPT", "NormalContrast" },
  ["rm"] = { "MORE", "NormalContrast" },
  ["r?"] = { "CONFIRM", "NormalContrast" },
  ["!"] = { "SHELL", "ModeMsg" },
}

local statusline_modules = {}

statusline_modules.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1]
  -- local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. right_separator

  -- return current_mode .. mode_sep1 .. "%#ModeMsg#" .. right_separator
  return current_mode .. "%  " .. right_separator
end

statusline_modules.fileInfo = function()
  local icon = "  "
  local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"

  if filename ~= "Empty " then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)
      icon = (ft_icon ~= nil and " " .. ft_icon) or ""
    end

    filename = " " .. filename .. " "
  end

  -- return "%#St_file_info#" .. icon .. filename .. "%#Visual#" .. right_separator
  return "%  " .. icon .. filename .. "%  " .. right_separator
end

statusline_modules.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = "   " .. git_status.head .. " "

  return "%#DiffText#" .. branch_name .. "%#DiffAdded#" .. added .. "%#DiffChanged#" .. changed .. "%#DiffRemoved#" .. removed
end

-- LSP STUFF
statusline_modules.LSP_progress = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

  return ("%#Function#" .. content) or ""
end

statusline_modules.LSP_Diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  errors = (errors and errors > 0) and ("%#DiagnosticError#" .. " " .. errors .. " ") or ""
  warnings = (warnings and warnings > 0) and ("%#DiagnosticWarning#" .. "  " .. warnings .. " ") or ""
  hints = (hints and hints > 0) and ("%#DiagnosticHint#" .. "ﯧ " .. hints .. " ") or ""
  info = (info and info > 0) and ("%#DiagnosticInfo#" .. " " .. info .. " ") or ""

  return errors .. warnings .. hints .. info
end

statusline_modules.LSP_status = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and "%#NormalContrast#" .. "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end
end

statusline_modules.cwd = function()
  local dir_icon = "%#Number#" .. " "
  local dir_name = "%#Number#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
  -- return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. left_separator .. dir_icon .. dir_name)) or ""
  return (vim.o.columns > 85 and ("%  " .. left_separator .. dir_icon .. dir_name)) or ""
end

statusline_modules.cursor_position = function()
  -- local left_sep = "%#St_pos_sep#" .. left_separator .. "%#St_pos_icon#" .. " "
  local left_sep = "%  " .. left_separator .. "%  #" .. " "

  local current_line = fn.line "."
  local total_line = fn.line "$"
  local text = math.modf((current_line / total_line) * 100) .. tostring "%%"

  text = (current_line == 1 and "Top") or text
  text = (current_line == total_line and "Bot") or text

  return left_sep .. "%#Tag#" .. " " .. text .. " "
end

return statusline_modules
