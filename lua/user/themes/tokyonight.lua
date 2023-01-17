require("tokyonight").setup({
  style = "storm", -- the theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- the theme is used when the background is set to light
  styles = {
    comments = { italic = true },
    functions = { italic = true },
    -- background styles. can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "normal", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- set a darker background on sidebar-like windows. for example: `["qf", "vista_kind", "terminal", "packer"]`
})

-- vim.cmd "colorscheme tokyonight"
