return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
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
        "cmake",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    cond = function()
      return not vim.g.vscode
    end,
    opts = require "configs.cmp",
  },

  {
    "nvim-telescope/telescope.nvim",
    cond = function()
      return not vim.g.vscode
    end,
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "2kabhishek/nerdy.nvim" },
      { "ProfessorMinius/telescope-git-diff-gitsigns.nvim" },
    },
    opts = require "configs.telescope",
  },

  {
    "folke/which-key.nvim",
    cond = function()
      return not vim.g.vscode
    end,
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    cond = function()
      return not vim.g.vscode
    end,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
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

  {
    "MeanderingProgrammer/render-markdown.nvim",
    cond = function()
      return not vim.g.vscode
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
