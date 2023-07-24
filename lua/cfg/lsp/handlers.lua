-- [nfnl] Compiled from fnl/cfg/lsp/handlers.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local lspconfig = autoload("lspconfig")
local cmp_nvim_lsp = autoload("cmp_nvim_lsp")
local which_key = autoload("which-key")
local function create_handler(server_name, server_opts)
  local opts = {}
  local function _2_(_client, bufnr)
    local _4_
    do
      local _3_ = {border = "rounded"}
      local function _5_(...)
        return vim.diagnostic.open_float(_3_, ...)
      end
      _4_ = _5_
    end
    return which_key.register({l = {name = "lsp/diagnostics", D = {vim.lsp.buf.declaration, "Go to declaration"}, d = {vim.lsp.buf.definition, "Go to definition"}, i = {vim.lsp.buf.implementation, "Go to implementation"}, r = {vim.lsp.buf.references, "Open symbol references"}, h = {vim.lsp.buf.hover, "Open hover"}, s = {vim.lsp.buf.signature_help, "Open signature help"}, l = {_4_, "Open diagnostic information"}}}, {prefix = "<Leader>", buffer = bufnr})
  end
  opts.on_attach = _2_
  opts.capabilities = cmp_nvim_lsp.default_capabilities()
  local server = lspconfig[server_name]
  return server.setup(vim.tbl_deep_extend("force", (server_opts or {}), opts))
end
local function default(server_name)
  return create_handler(server_name)
end
local function fennel_language_server()
  return create_handler("fennel_language_server", {settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
end
local function lua_ls()
  return create_handler("lua_ls", {settings = {Lua = {runtime = {version = "LuaJIT"}, dignostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}, telemetry = {enable = false}}}})
end
local function pyright()
  return create_handler("pyright", {settings = {python = {analysis = {typeCheckingMode = "off"}}}})
end
return {default, lua_ls = lua_ls, fennel_language_server = fennel_language_server, pyright = pyright}
