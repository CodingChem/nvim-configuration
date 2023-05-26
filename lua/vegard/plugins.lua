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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use { "catppuccin/nvim", as = "catppuccin" } 
  use "akinsho/toggleterm.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "kyazdani42/nvim-tree.lua"
  use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
