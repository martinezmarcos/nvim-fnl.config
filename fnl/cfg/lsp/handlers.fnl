(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(local lspconfig (autoload :lspconfig))
(local cmp-nvim-lsp (autoload :cmp_nvim_lsp))

(fn create-handler [server-name server-opts]
  "Helper function to create an LSP handler body with some shared opts"
  (local opts {})
  (set opts.on_attach
       (fn [_client bufnr]
         (let [keymap vim.keymap.set
               bufopts (fn [desc]
                         {: desc :noremap true :silent true :buffer bufnr})]
           (keymap :n :gD vim.lsp.buf.declaration (bufopts "Go to declaration"))
           (keymap :n :gd vim.lsp.buf.definition (bufopts "Go to definition"))
           (keymap :n :gi vim.lsp.buf.implementation
                   (bufopts "Go to implementation"))
           (keymap :n :gr vim.lsp.buf.references (bufopts "Open references"))
           (keymap :n :K vim.lsp.buf.hover (bufopts :Hover))
           (keymap :n :<C-k> vim.lsp.buf.signature_help
                   (bufopts "Signature help")))))
  (set opts.capabilities (cmp-nvim-lsp.default_capabilities))
  (let [server (. lspconfig server-name)]
    (server.setup (vim.tbl_deep_extend :force (or server-opts {}) opts))))

(fn default [server-name]
  (create-handler server-name))

(fn fennel_language_server []
  (create-handler :fennel_language_server
                  {:settings {:fennel {:diagnostics {:globals [:vim]}
                                       :workspace {:library (vim.api.nvim_list_runtime_paths)}}}}))

(fn lua_ls []
  (create-handler :lua_ls
                  {:settings {:Lua {:runtime {:version :LuaJIT}
                                    :dignostics {:globals [:vim]}
                                    :workspace {:library (vim.api.nvim_list_runtime_paths)}
                                    :telemetry {:enable false}}}}))

(fn pyright []
  (create-handler :pyright
                  {:settings {:python {:analysis {:typeCheckingMode :off}}}}))

{1 default : lua_ls : fennel_language_server : pyright}
