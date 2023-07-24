-- [nfnl] Compiled from fnl/cfg/nvim-tree.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
do
  local ok_3f, nvim_tree = pcall(require, "nvim-tree")
  local _2_ = ok_3f
  if (_2_ == false) then
    notify.error("nvim-tree is not installed")
  elseif (_2_ == true) then
    local setup = nvim_tree.setup
    local function on_attach(bufnr)
      local nvim_tree_api = autoload("nvim-tree.api")
      local function opts(desc)
        return {desc = ("nvim-tree: " .. desc), buffer = bufnr, noremap = true, silent = true, nowait = true}
      end
      nvim_tree_api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "?", nvim_tree_api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "l", nvim_tree_api.node.open.edit, opts("Open"))
      return vim.keymap.set("n", "h", nvim_tree_api.node.navigate.parent_close, opts("Close directory"))
    end
    setup({on_attach = on_attach, diagnostics = {enable = true}, renderer = {highlight_git = true, root_folder_modifier = ":t", icons = {glyphs = {default = "\238\152\146", symlink = "\239\146\129", git = {unstaged = "\239\145\132", staged = "S", untracked = "U"}}}}, actions = {open_file = {quit_on_open = true}}})
  else
  end
end
return {}
