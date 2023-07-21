-- [nfnl] Compiled from  by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
do
  local colorscheme = "tokyonight-night"
  local _2_, _3_ = pcall(vim.cmd, ("colorscheme " .. colorscheme))
  if ((_2_ == false) and true) then
    local _ = _3_
    notify(("colorscheme " .. colorscheme .. " is not available"))
  else
  end
end
return {}
