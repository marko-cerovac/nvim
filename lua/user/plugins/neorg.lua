local neorg = require "neorg"

vim.g.maplocalleader = " "

neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {
            --[[ config = {
                icon_preset = "diamond"
            } ]]
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "neorg"
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Documents/notes",
                    school = "~/Documents/notes/school"
                }
            }
        }
    }
}
