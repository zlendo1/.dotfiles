return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "cpp",
        "cuda",
        "git_config",
        "gpg",
        "javascript",
        "json",
        "julia",
        "python",
        "regex",
        "sql",
        "toml",
        "vue",
        "yaml",
        "pug",
        "java",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "2kabhishek/nerdy.nvim" },
      { "ProfessorMinius/telescope-git-diff-gitsigns.nvim" },
    },
    opts = require "configs.telescope",
  },

  {
    "folke/which-key.nvim",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
