local telescope = require "telescope"
local actions   = require "telescope.actions"
local builtin   = require "telescope.builtin"
local themes    = require "telescope.themes"

local map  = vim.keymap.set
local opts = { silent = true }

telescope.setup {
    defaults = themes.get_ivy {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-s>"] = actions.select_horizontal,
            },
            n = {
                ["s"] = actions.select_horizontal,
                ["v"] = actions.select_vertical,
                ["t"] = actions.select_tab,
            },
        },
        prompt_prefix = " ",
        selection_caret = " ",
        multi_icon = "落",
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer",
                },
                n = {
                    ["d"] = "delete_buffer",
                },
            },
        },
        commands = { theme = "dropdown" },
        colorscheme = { theme = "dropdown" },
    },
    extensions = {
        ["file_browser"] = {
            hijack_netrw = true,
        },
        ["ui-select"] = {
            themes.get_dropdown {},
        },
    },
}

-- load extensions
telescope.load_extension "fzy_native"
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"

local neovim_settings = function()
    builtin.find_files {
        prompt_title = "NeoVim Settings",
        cwd = vim.fn.stdpath "config" .. "/lua/user",
    }
end

local browse_folders = function ()
    telescope.extensions.file_browser.file_browser({ files = false })
end

-- set keymaps
map("n", "<leader>;", builtin.buffers, opts)
map("n", "gc", builtin.commands, opts)
map("n", "gs", neovim_settings, opts)
map("n", "]t", builtin.colorscheme, opts)
map("n", "<leader>e", telescope.extensions.file_browser.file_browser, opts)
map("n", "<leader>fj", browse_folders, opts)
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>gf", builtin.git_files, opts)
map("n", "<leader>gc", builtin.git_commits, opts)
map("n", "<leader>fr", builtin.oldfiles, opts)
map("n", "<leader>ft", builtin.colorscheme, opts)
