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
return {}
