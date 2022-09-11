local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.setup {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " Choice", "TSComment" } },
            },
        },
    },
}

vim.keymap.set("i", "<M-e>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

require("luasnip.loaders.from_lua").lazy_load {
    paths = vim.fn.stdpath "config" .. "/snippets",
}
