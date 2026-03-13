return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-java/nvim-java",
    },
    config = function()
      require("java").setup()
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

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = ""
    end,
    ft = { "markdown" },
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        events = "InsertEnter",
        config = function()
          require("copilot").setup {
            suggestion = { enabled = false },
            panel = { enabled = false },
          }
        end,
      },
    },
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require "copilot_cmp"
      copilot_cmp.setup(opts)
      vim.lsp.on_attach(function()
        copilot_cmp._on_insert_enter {}
      end, "copilot")
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "open copilot chat" },
      { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "explain code" },
      { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "review code" },
      { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "fix code issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "optimize code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "generate docs" },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "generate tests" },
    },
  },
}
