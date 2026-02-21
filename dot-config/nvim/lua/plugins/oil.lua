return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "-", function() require("oil").toggle_float() end, desc = "File explorer" } },
  opts = {},
}
