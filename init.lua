-- Neovim config file
-- 	Vegard

-- Shared extensions
------- options:
require "vegard.base.options"
require "vegard.base.keymaps"
require "vegard.base.plugins"
require "vegard.base.theme"
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end
