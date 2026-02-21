return {
  "vim-test/vim-test",
  lazy = true,
  keys = {
    {
      "<leader>rn",
      "<cmd>TestNearest<cr>",
      desc = "[R]un [N]earest test",
    },
    {
      "<leader>rf",
      "<cmd>TestFile<cr>",
      desc = "[R]un [F]ile tests",
    },
    {
      "<leader>rl",
      "<cmd>TestLast<cr>",
      desc = "[R]un [L]ast test",
    },
    {
      "<leader>rv",
      "<cmd>TestVisit<cr>",
      desc = "Visit last test file",
    },
  },
  init = function()
    vim.g["test#strategy"] = "neovim"
    vim.g["test#neovim#term_position"] = "botright vs"
    vim.g["test#ruby#rspec#options"] = {
      nearest = "--format documentation",
      file = "--format progress",
      suite = "--format progress",
    }
  end,
}
