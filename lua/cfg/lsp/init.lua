-- [nfnl] Compiled from fnl/cfg/lsp/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
do
  local ok_3f, mason = pcall(require, "mason")
  local _2_ = ok_3f
  if (_2_ == false) then
    notify.error("mason is not installed")
  elseif (_2_ == true) then
    mason.setup({})
  else
  end
end
do
  local ok_3f, mason_lspconfig = pcall(require, "mason-lspconfig")
  local _4_ = ok_3f
  if (_4_ == false) then
    notify.error("mason-lspconfig is not installed")
  elseif (_4_ == true) then
    local setup_handlers = mason_lspconfig.setup_handlers
    mason_lspconfig.setup({ensure_installed = {"lua_ls", "fennel_language_server", "pyright", "rust_analyzer"}})
    setup_handlers(require("cfg.lsp.handlers"))
  else
  end
end
vim.diagnostic.config({update_in_insert = true, underline = true, severity_sort = true, float = {style = "minimal", border = "rounded", source = "always", header = "", prefix = "", focusable = false}, virtual_text = false})
do end (vim.lsp.handlers)["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
do end (vim.lsp.handlers)["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})
return {}
