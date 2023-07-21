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
           (mason-lspconfig.setup {:ensure_installed [:lua_ls :fennel_language_server :pyright :rust_analyzer]})
           (setup-handlers (require :cfg.lsp.handlers)))))

{}
