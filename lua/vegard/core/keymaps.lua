--==========Keymaps by==========
--==========    Vegard==========
-- options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Window Controlls:
---- Switching
------ left
keymap("n", "<C-h>", "<C-w>h", opts)
------ right
keymap("n", "<C-l>", "<C-w>l", opts)
------ down
keymap("n", "<C-j>", "<C-w>j", opts)
------ up
keymap("n", "<C-k>", "<C-w>k", opts)
---- Rezising
------ left
keymap("n", "<A-h>", ":vertical resize +2<CR>",opts)
------ right
keymap("n", "<A-l>", ":vertical resize -2<CR>",opts)
------ down e:
keymap("n", "<A-j>", ":resize -2<CR>",opts)
------ up
keymap("n", "<A-k>", ":resize +2<CR>",opts)
-- Buffers:
---- navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Indent
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)
-- Move text down and up
keymap("v", "K", ":m '<-2<CR>gv=gv", opts) 
keymap("v", "J", ":m '>+1<CR>gv=gv", opts) 
-- Better page movement
keymap("v", "<C-d>", "<C-d>zz>", opts)
keymap("v", "<C-u>", "<C-u>zz>", opts)

--============================================
-----------------Plugins----------------------
--============================================
local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.register({
  q = {"<cmd>q<cr>", "Exit"},
  w = {"<cmd>w<cr>", "Write"},
  t = {
    name = "Tabs",
    n = {"<cmd>tabnew<cr>", "New Tab"},
    l = {"<cmd>tabNext<cr>", "Next Tab"},
    h = {"<cmd>tabPrevious<cr>", "Previous Tab"},
    q = {"<cmd>tabclose<cr>", "Close Tab"}
  },
  s = {
    name = "Split",
    h = {"<cmd>vertical split<cr>", "Vertical Split"},
    v = {"<cmd>split<cr>", "Horizontal Split"}
  },
  g = {
    name = "Git",
    g = {":lua _LAZYGIT_TOGGLE()<cr>", "Lazygit"},
    k = {":Gitsigns prev_hunk<cr>", "Previous Hunk"},
    j = {":Gitsigns next_hunk<cr>", "Next Hunk"},
    d = {":Gitsigns diffthis<cr>", "Diff"},
    l = {":Gitsigns preview_hunk<cr>", "Preview"},
    a = {":Gitsigns stage_hunk<cr>", "Stage Hunk"},
    A = {":Gitsigns stage_buffer<cr>", "Stage Buffer"}
  }
}, {prefix = "<leader>" })


---- New windows
keymap("n", "<leader>sh", ":vertical split<CR>", opts)
keymap("n", "<leader>sv", ":split<CR>", opts)
-- Open NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- open lazygit:
keymap("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
