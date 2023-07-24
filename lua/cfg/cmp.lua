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
    local function _5_(entry, vim_item)
      vim_item.kind = string.format("%s", ({Text = "\239\157\190", Method = "m", Function = "\239\158\148", Constructor = "\239\144\165", Field = "\238\156\150", Variable = "\239\154\166", Class = "\239\160\150", Interface = "\239\131\168", Module = "\239\146\135", Property = "\239\130\173", Unit = "\238\136\159", Value = "\239\162\159", Enum = "\239\133\157", Keyword = "\239\160\138", Snippet = "\239\131\132", Color = "\239\163\151", File = "\239\156\152", Reference = "\239\146\129", Folder = "\239\157\138", EnumMember = "\239\133\157", Constant = "\239\155\188", Struct = "\239\134\179", Event = "\239\131\167", Operator = "\239\154\148", TypeParameter = "\239\158\131"})[vim_item.kind])
      vim_item.menu = ({nvim_lua = "[NLUA]", buffer = "[BUFR]", path = "[PATH]"})[entry.source.name]
      return vim_item
    end
    local function _6_(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
      end
      return fallback()
    end
    local function _8_(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
      end
      return fallback()
    end
    cmp.setup({sources = cmp.config.sources(_3_(...)), window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}, formatting = {fields = {"kind", "abbr", "menu"}, format = _5_}, mapping = cmp.mapping.preset.insert({["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), ["<C-d>"] = cmp.mapping.scroll_docs(4), ["<C-u>"] = cmp.mapping.scroll_docs(-4), ["<C-l>"] = cmp.mapping(cmp.mapping.close(), {"i", "c"}), ["<C-h>"] = cmp.mapping(cmp.mapping.abort(), {"i", "c"}), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<Tab>"] = cmp.mapping(_6_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_8_, {"i", "s"})})})
    cmp.setup.cmdline("/", {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
    cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
  else
  end
end
return {}
