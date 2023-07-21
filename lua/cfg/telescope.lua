-- [nfnl] Compiled from fnl/cfg/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local ok_3f, telescope = pcall(require, "telescope")
local _2_ = ok_3f
if (_2_ == false) then
  return notify.error("telescope is not installed")
elseif (_2_ == true) then
  local actions = autoload("telescope.actions")
  return telescope.setup({defaults = {mappings = {i = {["<C-h>"] = actions.which_key, ["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous}}}})
else
  return nil
end
