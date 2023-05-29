local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("vegard.lsp.mason")
require("vegard.lsp.handlers").setup()
require("vegard.lsp.null-ls")
