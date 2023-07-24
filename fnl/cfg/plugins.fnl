(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? packer) (pcall require :packer)]
  (match ok?
    false (notify.error "packer was not successfully installed")
    true (packer.startup (fn [use]
                           ;; Have packer manage itself
                           (use :wbthomason/packer.nvim)
                           (use :Olical/nfnl)
                           (use :nvim-lua/plenary.nvim)
                           (use :folke/which-key.nvim)
                           (use :nvim-lualine/lualine.nvim :requires)
                           (use :folke/tokyonight.nvim)
                           (use :ellisonleao/gruvbox.nvim)
                           (use :Mofiqul/dracula.nvim)
                           (use :nvim-tree/nvim-tree.lua)
                           (use :nvim-tree/nvim-web-devicons)
                           (use {1 :nvim-treesitter/nvim-treesitter
                                 :run ":TSUpdate"})
                           (use {1 :nvim-telescope/telescope.nvim
                                 :tag :0.1.2
                                 :requires [[:nvim-lua/plenary.nvim]]})
                           (use :neovim/nvim-lspconfig)
                           (use :hrsh7th/cmp-nvim-lsp)
                           (use :hrsh7th/cmp-nvim-lua)
                           (use :hrsh7th/cmp-buffer)
                           (use :hrsh7th/cmp-path)
                           (use :hrsh7th/cmp-cmdline)
                           (use :hrsh7th/nvim-cmp)
                           (use {1 :williamboman/mason.nvim
                                 :run ":MasonUpdate"})
                           (use :williamboman/mason-lspconfig.nvim)))))

{}
