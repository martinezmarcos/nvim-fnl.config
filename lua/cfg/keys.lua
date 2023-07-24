-- [nfnl] Compiled from fnl/cfg/keys.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local nvim_tree_api = autoload("nvim-tree.api")
local telescope_builtin = autoload("telescope.builtin")
do
  local ok_3f, which_key = pcall(require, "which-key")
  local _2_ = ok_3f
  if (_2_ == false) then
    notify.error("which-key is not installed")
  elseif (_2_ == true) then
    local keymap = vim.keymap.set
    local register = which_key.register
    local setup = which_key.setup
    local opts = {noremap = true, silent = true}
    keymap("", "<Space>", "<Nop>", opts)
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    register({w = {name = "window", s = {"<C-w>s", "Split window horizontally"}, v = {"<C-w>v", "Split window vertically"}, c = {"<C-w>c", "Close current window"}, h = {"<C-w>h", "Move cursor, window left"}, j = {"<C-w>j", "Move cursor, window below"}, k = {"<C-w>k", "Move cursor, window above"}, l = {"<C-w>l", "Move cursor, window right"}}, b = {name = "buffer", l = {"<Cmd>bnext<CR>", "Next buffer"}, h = {"<Cmd>bprevious<CR>", "Previous buffer"}}, u = {name = "undo/redo", u = {"<Cmd>undo<CR>", "Undo"}, r = {"<Cmd>redo<CR>", "Redo"}}, t = {name = "toggle", f = {nvim_tree_api.tree.toggle, "Toggle file tree"}}, f = {name = "find", f = {telescope_builtin.find_files, "Find files"}, g = {telescope_builtin.live_grep, "Live grep"}, b = {telescope_builtin.buffers, "Find buffers"}, h = {telescope_builtin.help_tags, "Find in help tags"}, t = {telescope_builtin.treesitter, "Find Tree-sitter symbols"}}}, {prefix = "<Leader>"})
    register({g = {name = "change-later", s = {":sort", "Sort selected lines"}}}, {prefix = "<Leader>", mode = "v"})
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)
    setup({})
  else
  end
end
return {}
