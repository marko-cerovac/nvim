local neorg = require "neorg"

vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function ()
        vim.bo.shiftwidth = 3
        vim.bo.tabstop = 3
    end,
    group = vim.api.nvim_create_augroup("NeorgShiftWidth", {
        clear = true
    })
})

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
            config = {
                icon_preset = "diamond"
            }
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "neorg"
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Documents/neorg/notes",
                    school = "~/Documents/neorg/school",
                    system = "~/Documents/neorg/system"
                },
                default_workspace = "notes"
            }
        }
    }
}
