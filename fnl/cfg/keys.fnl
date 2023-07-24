(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))
(local nvim-tree-api (autoload :nvim-tree.api))
(local telescope-builtin (autoload :telescope.builtin))

(let [(ok? which-key) (pcall require :which-key)]
  (match ok?
    false (notify.error "which-key is not installed")
    true (let [keymap vim.keymap.set
               register which-key.register
               setup which-key.setup]
           (local opts {:noremap true :silent true})
           ;; Remap <Space> as <Leader>
           (keymap "" :<Space> :<Nop> opts)
           (set vim.g.mapleader " ")
           (set vim.g.maplocalleader " ")
           ;; Set timeout length for which-key in ms
           (set vim.o.timeout true)
           (set vim.o.timeoutlen 300)
           ;; [NORMAL]
           (register {:w {:name :window
                          :s [:<C-w>s "Split window horizontally"]
                          :v [:<C-w>v "Split window vertically"]
                          :c [:<C-w>c "Close current window"]
                          :h [:<C-w>h "Move cursor, window left"]
                          :j [:<C-w>j "Move cursor, window below"]
                          :k [:<C-w>k "Move cursor, window above"]
                          :l [:<C-w>l "Move cursor, window right"]}
                      :b {:name :buffer
                          :l [:<Cmd>bnext<CR> "Next buffer"]
                          :h [:<Cmd>bprevious<CR> "Previous buffer"]}
                      :u {:name :undo/redo
                          :u [:<Cmd>undo<CR> :Undo]
                          :r [:<Cmd>redo<CR> :Redo]}
                      :t {:name :toggle
                          :f [nvim-tree-api.tree.toggle "Toggle file tree"]}
                      :f {:name :find
                          :f [telescope-builtin.find_files "Find files"]
                          :g [telescope-builtin.live_grep "Live grep"]
                          :b [telescope-builtin.buffers "Find buffers"]
                          :h [telescope-builtin.help_tags "Find in help tags"]
                          :t [telescope-builtin.treesitter
                              "Find Tree-sitter symbols"]}}
                     {:prefix :<Leader>})
           ;; [VISUAL]
           (register {:g {:name :change-later
                          :s [":sort" "Sort selected lines"]}
                      }
                     {:prefix :<Leader> :mode :v})
           ;; Stay in VISUAL mode after adjusting indentation
           (keymap :v "<" :<gv opts)
           (keymap :v ">" :>gv opts)
           (setup {}))))

{}
