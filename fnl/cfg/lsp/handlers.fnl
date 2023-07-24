(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(local lspconfig (autoload :lspconfig))
(local cmp-nvim-lsp (autoload :cmp_nvim_lsp))
(local which-key (autoload :which-key))

(fn create-handler [server-name server-opts]
  "Helper function to create an LSP handler body with some shared opts"
  (local opts {})
  (set opts.on_attach
       (fn [_client bufnr]
         (which-key.register {:l {:name :lsp/diagnostics
                                  :D [vim.lsp.buf.declaration
                                      "Go to declaration"]
                                  :d [vim.lsp.buf.definition
                                      "Go to definition"]
                                  :i [vim.lsp.buf.implementation
                                      "Go to implementation"]
                                  :r [vim.lsp.buf.references
                                      "Open symbol references"]
                                  :h [vim.lsp.buf.hover
                                      "Open hover"]
                                  :s [vim.lsp.buf.signature_help
                                      "Open signature help"]
                                  :l [(partial vim.diagnostic.open_float
                                               {:border :rounded})
                                      "Open diagnostic information"]}}
                             {:prefix :<Leader> :buffer bufnr})))
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
