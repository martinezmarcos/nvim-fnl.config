-- [nfnl] Compiled from  by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local lspconfig = autoload("lspconfig")
local cmp_nvim_lsp = autoload("cmp_nvim_lsp")
local function create_handler(server_name, server_opts)
  local opts = {}
  local function _2_(_client, bufnr)
    local keymap = vim.keymap.set
    local bufopts
    local function _3_(desc)
      return {desc = desc, noremap = true, silent = true, buffer = bufnr}
    end
    bufopts = _3_
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts("Go to declaration"))
    keymap("n", "gd", vim.lsp.buf.definition, bufopts("Go to definition"))
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts("Go to implementation"))
    keymap("n", "gr", vim.lsp.buf.references, bufopts("Open references"))
    keymap("n", "K", vim.lsp.buf.hover, bufopts("Hover"))
    return keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts("Signature help"))
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
