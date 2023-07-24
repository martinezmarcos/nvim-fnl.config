(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? cmp) (pcall require :cmp)]
  (match ok?
    false (notify.error "cmp is not installed")
    true (let []
           ;; cmp global config
           (cmp.setup {:sources (cmp.config.sources (icollect [_ source (ipairs [:nvim_lsp
                                                                                 :nvim_lua
                                                                                 :buffer
                                                                                 :path])]
                                                      {:name source}))
                       :window {:completion (cmp.config.window.bordered)
                                :documentation (cmp.config.window.bordered)}
                       :formatting {:fields [:kind :abbr :menu]
                                    :format (fn [entry vim-item]
                                              (set vim-item.kind
                                                   (string.format "%s"
                                                                  (. {:Text ""
                                                                      :Method :m
                                                                      :Function ""
                                                                      :Constructor ""
                                                                      :Field ""
                                                                      :Variable ""
                                                                      :Class ""
                                                                      :Interface ""
                                                                      :Module ""
                                                                      :Property ""
                                                                      :Unit ""
                                                                      :Value ""
                                                                      :Enum ""
                                                                      :Keyword ""
                                                                      :Snippet ""
                                                                      :Color ""
                                                                      :File ""
                                                                      :Reference ""
                                                                      :Folder ""
                                                                      :EnumMember ""
                                                                      :Constant ""
                                                                      :Struct ""
                                                                      :Event ""
                                                                      :Operator ""
                                                                      :TypeParameter ""}
                                                                     vim-item.kind)))
                                              (set vim-item.menu
                                                   (. {:nvim_lua "[NLUA]"
                                                       :buffer "[BUFR]"
                                                       :path "[PATH]"}
                                                      entry.source.name))
                                              vim-item)}
                       :mapping (cmp.mapping.preset.insert {:<C-j> (cmp.mapping (cmp.mapping.select_next_item)
                                                                                [:i
                                                                                 :c])
                                                            :<C-k> (cmp.mapping (cmp.mapping.select_prev_item)
                                                                                [:i
                                                                                 :c])
                                                            :<C-d> (cmp.mapping.scroll_docs 4)
                                                            :<C-u> (cmp.mapping.scroll_docs -4)
                                                            :<C-l> (cmp.mapping (cmp.mapping.close)
                                                                                [:i
                                                                                 :c])
                                                            :<C-h> (cmp.mapping (cmp.mapping.abort)
                                                                                [:i
                                                                                 :c])
                                                            :<CR> (cmp.mapping.confirm {:select true})
                                                            :<Tab> (cmp.mapping (fn [fallback]
                                                                                  (if (cmp.visible)
                                                                                      (cmp.select_next_item))
                                                                                  (fallback))
                                                                                [:i
                                                                                 :s])
                                                            :<S-Tab> (cmp.mapping (fn [fallback]
                                                                                    (if (cmp.visible)
                                                                                        (cmp.select_prev_item))
                                                                                    (fallback))
                                                                                  [:i
                                                                                   :s])})})
           ;; cmp `/` cmdline config
           (cmp.setup.cmdline "/"
                              {:mapping (cmp.mapping.preset.cmdline)
                               :sources [{:name :buffer}]})
           ;; cmp `:` cmdline config
           (cmp.setup.cmdline ":"
                              {:mapping (cmp.mapping.preset.cmdline)
                               :sources (cmp.config.sources [{:name :path}]
                                                            [{:name :cmdline}])}))))

{}
