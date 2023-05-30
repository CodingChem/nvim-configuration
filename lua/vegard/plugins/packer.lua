local fn = vim.fn

-- install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen NeoVim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Watch dog to re-source after save
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Packer packages
return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  -- base files
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" } 
  -- Toggleterm
  use "akinsho/toggleterm.nvim"
  -- Nvim tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  -- Exit buffer safely
  use "moll/vim-bbye"
  -- Git integration
  use "lewis6991/gitsigns.nvim"
  -- better highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP Configurations
  use { "neovim/nvim-lspconfig"} -- enable LSP
  use { "williamboman/mason.nvim"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim"}
  use { "jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
  use { "RRethy/vim-illuminate"}
  -- documenting keybinds
  use { "folke/which-key.nvim"}
  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
