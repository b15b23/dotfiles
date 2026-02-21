return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function() -- This is the function that runs, AFTER loading
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      win = {
        border = "single",
      },
    })
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>r", group = "Run" },
      { "<leader>s", group = "Search/Grep" },
      { "<leader>u", group = "User" },
    })
  end,
}
