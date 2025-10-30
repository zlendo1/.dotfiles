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
  "openscad_lsp",
  "basedpyright",
  "rust_analyzer",
}

vim.lsp.enable(servers)
