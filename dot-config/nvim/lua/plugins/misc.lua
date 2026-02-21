return {
  "tpope/vim-sleuth",
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    opts = { signs = false },
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
    config = function(_, opts)
      require("treesj").setup(opts)
      vim.keymap.set("n", "gT", function()
        require("treesj").toggle()
      end)
      vim.keymap.set("n", "gS", function()
        require("treesj").split()
      end)
      vim.keymap.set("n", "gJ", function()
        require("treesj").join()
      end)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
