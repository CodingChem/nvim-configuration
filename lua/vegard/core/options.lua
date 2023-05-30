-- Options
local options = {
  -- Misc options
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  fileencoding = "utf-8",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = true,
  swapfile = false,
  cursorline = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,
  -- tabs
  showtabline = 2,
  -- configuring tabs
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  -- sensible windows
  splitbelow = true,
  splitright = true,
  -- smart
  smartcase = true,
  smartindent = true,
  -- numbers
  number = true,
  relativenumber = true,
  numberwidth = 4,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
