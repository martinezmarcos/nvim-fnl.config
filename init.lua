local ensure_installed = function(plugin)
  local _, _, plugin_name = string.find(plugin, "%S+/(%S+)")
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/' .. plugin_name
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/' .. plugin, install_path})
  end
  vim.opt.runtimepath:prepend(install_path)
end

-- Automatically install packer.nvim, nfnl
ensure_installed("wbthomason/packer.nvim")
ensure_installed("Olical/nfnl")

vim.api.nvim_create_user_command("PluginSync", "source lua/cfg/plugins.lua | PackerSync", {})

-- eagerly disable netrw, see :h nvim-tree.disable_netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require "nfnl"
require "cfg"
