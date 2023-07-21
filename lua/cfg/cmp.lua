-- [nfnl] Compiled from fnl/cfg/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
do
  local ok_3f, cmp = pcall(require, "cmp")
  local _2_ = ok_3f
  if (_2_ == false) then
    notify.error("cmp is not installed")
  elseif (_2_ == true) then
    local function _3_(...)
      local tbl_17_auto = {}
      local i_18_auto = #tbl_17_auto
      for _, source in ipairs({"nvim_lsp", "nvim_lua", "buffer", "path"}) do
        local val_19_auto = {name = source}
        if (nil ~= val_19_auto) then
          i_18_auto = (i_18_auto + 1)
          do end (tbl_17_auto)[i_18_auto] = val_19_auto
        else
        end
      end
      return tbl_17_auto
    end
    local function _5_(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
      end
      return fallback()
    end
    local function _7_(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
      end
      return fallback()
    end
    cmp.setup({sources = cmp.config.sources(_3_(...)), window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}, mapping = cmp.mapping.preset.insert({["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-l>"] = cmp.mapping(cmp.mapping.close(), {"i", "c"}), ["<C-h>"] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<Tab>"] = cmp.mapping(_5_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_7_, {"i", "s"})})})
    cmp.setup.cmdline("/", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
    cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
  else
  end
end
return {}
