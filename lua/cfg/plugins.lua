-- [nfnl] Compiled from  by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
do
  local ok_3f, packer = pcall(require, "packer")
  local _2_ = ok_3f
  if (_2_ == false) then
    notify.error("packer was not successfully installed")
  elseif (_2_ == true) then
    local function _3_(use)
      use("wbthomason/packer.nvim")
      use("Olical/nfnl")
      use("nvim-lua/plenary.nvim")
      use("folke/which-key.nvim")
      use("nvim-lualine/lualine.nvim", "requires")
      use("folke/tokyonight.nvim")
      use("ellisonleao/gruvbox.nvim")
      use("nvim-tree/nvim-tree.lua")
      use("nvim-tree/nvim-web-devicons")
      use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
      use({"nvim-telescope/telescope.nvim", tag = "0.1.2", requires = {{"nvim-lua/plenary.nvim"}}})
      use("neovim/nvim-lspconfig")
      use("hrsh7th/cmp-nvim-lsp")
      use("hrsh7th/cmp-nvim-lua")
      use("hrsh7th/cmp-buffer")
      use("hrsh7th/cmp-path")
      use("hrsh7th/cmp-cmdline")
      use("hrsh7th/nvim-cmp")
      use({"williamboman/mason.nvim", run = ":MasonUpdate"})
      return use("williamboman/mason-lspconfig.nvim")
    end
    packer.startup(_3_)
  else
  end
end
return {}
