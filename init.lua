-- Neovim config file
-- 	Vegard

-- Shared extensions
------- options:
require "vegard.base.options"
require "vegard.base.keymaps"
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end
