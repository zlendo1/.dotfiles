if vim.g.vscode then
  return
end

require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "jdtls",
  "tailwindcss",
  "jsonls",
  "docker_compose_language_service",
  "dockerls",
  "kotlin_language_server",
  "lua_ls",
  "basedpyright",
  "rust_analyzer",
  "neocmake",
}

vim.lsp.enable(servers)
