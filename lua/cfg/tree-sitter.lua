-- [nfnl] Compiled from fnl/cfg/tree-sitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local ok_3f, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
local _2_ = ok_3f
if (_2_ == false) then
  return notify.error("nvim-treesitter is not installed")
elseif (_2_ == true) then
  local setup = nvim_treesitter_configs.setup
  return setup({ensure_installed = "all", ignore_install = {"bass", "beancount", "bicep", "c_sharp", "capnp", "d", "ebnf", "hare", "menhir", "po"}, highlight = {enable = true}, indent = {enable = true, disable = {"yaml"}}})
else
  return nil
end
