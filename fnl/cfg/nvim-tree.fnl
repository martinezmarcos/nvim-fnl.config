(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? nvim-tree) (pcall require :nvim-tree)]
  (match ok?
    false (notify.error "nvim-tree is not installed")
    true (let [setup nvim-tree.setup]
           (fn on-attach [bufnr]
             ;; Callback where we will set our keymaps for `nvim-tree`
             (let [nvim-tree-api (autoload :nvim-tree.api)]
               (fn opts [desc]
                 ;; Function to build the keymap opts with description set to `desc`
                 {:desc (.. "nvim-tree: " desc)
                  :buffer bufnr
                  :noremap true
                  :silent true
                  :nowait true})

               ;; Include default mappings
               (nvim-tree-api.config.mappings.default_on_attach bufnr)
               ;; Custom mappings
               (vim.keymap.set :n :? nvim-tree-api.tree.toggle_help (opts :Help))
               (vim.keymap.set :n :l nvim-tree-api.node.open.edit (opts :Open))
               (vim.keymap.set :n :h nvim-tree-api.node.navigate.parent_close
                               (opts "Close directory"))))

           (setup {:on_attach on-attach}))))

{}
