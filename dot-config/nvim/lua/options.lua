-- Use space for leader key
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Basic UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 120
-- vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.breakindent = true
vim.opt.tabstop = 4

-- Sync clipboard between neovim and OS
vim.opt.clipboard = "unnamedplus"

-- Case insensitive search unless search string includes caps
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Snappier UI
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Open vertical splits to the right and horizontal below current
vim.opt.splitright = true
vim.opt.splitbelow = true

-- How invisible chars are displayed
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show substitution previews
vim.opt.inccommand = "split"
vim.opt.hlsearch = true

-- Adds `CopyRelPath` command, to copy path from project root of the current file
vim.api.nvim_create_user_command("CopyRelPath", function()
  vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand("%"), ":."))
end, {})

-- KEYMAPS
--
-- In addition to these, plugin files may also be setting keymaps
-- `<leader>sk`

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<cr>", "<cmd>nohlsearch<CR>")

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Diagnostics ([d and ]d are built-in on 0.11+)
vim.diagnostic.config({ jump = { float = true } })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show error messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Show quickfix list" })

-- Add blank line above or below
vim.keymap.set("n", "[<Space>", "O<Esc>j", { desc = "Insert blank line above" })
vim.keymap.set("n", "]<Space>", "o<Esc>k", { desc = "Insert blank line below" })

-- Taming yank
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking" })
