--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/startscreen.lua
--       \/__/         \/__/       Desc: startscreen settings


vim.g.dashboard_default_executive = 'telescope.nvim'

vim.g.dashboard_custom_header = {
    [[                                                                ]],
    [[                                                                ]],
    [[                                                                ]],
    [[                       .|.            |.                        ]],
    [[                     .cc|:;           |::.                      ]],
    [[                   .cccc|:::;         |::::.                    ]],
    [[                  |ccccc|::::;        |:::::|                   ]],
    [[                  |ccccc|::::::;      |:::::|                   ]],
    [[       ___        |ccccc|:::::::;     |:::::|         ___       ]],
    [[      /\  \       |ccccc| ;:::::::;   |:::::|        /\__\      ]],
    [[     |::\  \      |ccccc|  ;:::::::;  |:::::|       /:/  /      ]],
    [[     |:|:\  \     |ccccc|   ;:::::::; |:::::|      /:/  /       ]],
    [[   __|:|\:\  \    |ccccc|     ;:::::::|:::::|     /:/  /  ___   ]],
    [[  /::::|_\:\__\   |ccccc|      ;::::::|:::::|    /:/__/  /\__\  ]],
    [[  \:\~~\  \/__/   |ccccc|        ;::::|:::::|    \:\  \ /:/  /  ]],
    [[   \:\  \          .cccc|         ;:::|::::.      \:\  /:/  /   ]],
    [[    \:\  \           .cc|           ;;|::.         \:\/:/  /    ]],
    [[     \:\__\          .cc|           ;;|::.          \::/  /     ]],
    [[      \/__/            .|            .|.             \/__/      ]],
    [[                                                                ]],
    [[                                                                ]],
    [[                          N E O V I M                           ]]
}

vim.g.dashboard_custom_section = {
    a = {
            description = {'  Find File                         Leader f f'},
            command = 'Telescope find_files'},
    b = {
            description = {'  Recently Used Files               Leader f r'},
            command = 'Telescope oldfiles'},
    c = {
            description = {'  Load Last Session                 Leader w l'},
            command = 'SessionLoad'},
    d = {
            description = {'  Find Word                         Leader f g'},
            command = 'Telescope live_grep'},
    e = {
            description = {'  Change Colorscheme                Leader f t'},
            command = 'Telescope colorscheme'},
    f = {
            description = {'  Settings                          Leader f s'},
            command = [[:lua require('plugins.telescope').neovim_rc()]]},
    h = {
            description = {'  Quit                                        '},
            command = 'q!'}
}

vim.api.nvim_set_keymap('n', '<leader>wl', [[<cmd>SessionLoad<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wa', [[<cmd>SessionSave<CR>]], { noremap = true, silent = true })
