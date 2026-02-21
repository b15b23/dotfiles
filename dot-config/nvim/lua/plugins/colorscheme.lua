-- Soothing pastel theme for (Neo)vim
-- https://github.com/catppuccin/nvim

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    background = {
      light = "latte",
      dark = "macchiato",
    },
    transparent_background = false,
    integrations = {
      blink_cmp = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      which_key = true,
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
