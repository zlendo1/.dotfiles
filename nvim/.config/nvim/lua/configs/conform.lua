local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    pug = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    tex = { "latexindent" },
    bib = { "bibtex-tidy" },
    rust = { "rustfmt" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    markdown = { "mdformat", "injected" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 750,
    lsp_fallback = true,
  },

  formatters = {
    latexindent = {
      stdin = true,
      append_args = function()
        return { "-m", "-l" }
      end,
    },
  },
}

return options
