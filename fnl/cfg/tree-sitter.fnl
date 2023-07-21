(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))

(let [(ok? nvim-treesitter-configs) (pcall require :nvim-treesitter.configs)]
  (match ok?
    false (notify.error "nvim-treesitter is not installed")
    true (let [setup nvim-treesitter-configs.setup]
           (setup {:ensure_installed :all
                   :ignore_install [:bass
                                    :beancount
                                    :bicep
                                    :c_sharp
                                    :capnp
                                    :d
                                    :ebnf
                                    :hare
                                    :menhir
                                    :po]
                   :highlight {:enable true}
                   :indent {:enable true :disable [:yaml]}}))))
