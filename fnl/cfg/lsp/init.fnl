(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? mason) (pcall require :mason)]
  (match ok?
    false (notify.error "mason is not installed")
    true (mason.setup {})))

(let [(ok? mason-lspconfig) (pcall require :mason-lspconfig)]
  (match ok?
    false (notify.error "mason-lspconfig is not installed")
    true (let [setup-handlers mason-lspconfig.setup_handlers]
           (mason-lspconfig.setup {:ensure_installed [:lua_ls
                                                      :fennel_language_server
                                                      :pyright
                                                      :rust_analyzer]})
           (setup-handlers (require :cfg.lsp.handlers)))))

(vim.diagnostic.config {:virtual_text false
                        :update_in_insert true
                        :underline true
                        :severity_sort true
                        :float {:focusable false
                                :style :minimal
                                :border :rounded
                                :source :always
                                :header ""
                                :prefix ""}})

(tset vim.lsp.handlers :textDocument/hover
      (vim.lsp.with vim.lsp.handlers.hover {:border :rounded}))

(tset vim.lsp.handlers :textDocument/signatureHelp
      (vim.lsp.with vim.lsp.handlers.signature_help {:border :rounded}))
{}
