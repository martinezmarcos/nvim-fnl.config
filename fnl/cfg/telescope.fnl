(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? telescope) (pcall require :telescope)]
  (match ok?
    false (notify.error "telescope is not installed")
    true (let [actions (autoload :telescope.actions)]
           (telescope.setup {:defaults {:mappings {:i {:<C-h> actions.which_key
                                                       :<C-j> actions.move_selection_next
                                                       :<C-k> actions.move_selection_previous}}}}))))
