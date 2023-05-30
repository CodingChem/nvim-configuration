-- Keymaps

-- opts
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
---- Menus
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
---- New windows
keymap("n", "<leader>h", ":vertical split<CR>", opts)
keymap("n", "<leader>v", ":split<CR>", opts)
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

-- Open NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- open lazygit:
keymap("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
