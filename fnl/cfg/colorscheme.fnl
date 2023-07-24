(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [colorscheme :dracula]
  (match (pcall vim.cmd (.. "colorscheme " colorscheme))
    (false _) (notify (.. "colorscheme " colorscheme " is not available"))))
{}
