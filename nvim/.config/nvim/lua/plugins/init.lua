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
      -- pinned until nvim-java is compatible with Mason 2.0
      { "mason-org/mason.nvim", version = "^1.0.0" },
      { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    },
    config = function()
      require("java").setup()
      require "configs.lspconfig"
    end,
  },

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
        "tmux",
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
    dependencies = {
      "micangl/cmp-vimtex",
    },
    opts = require "configs.cmp",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "2kabhishek/nerdy.nvim" },
      { "ProfessorMinius/telescope-git-diff-gitsigns.nvim" },
      { "nvim-telescope/telescope-bibtex.nvim" },
    },
    opts = require "configs.telescope",
  },

  {
    "folke/which-key.nvim",
    lazy = false,
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_mappings_prefix = "<space>l"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
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
      vim.g.mkdp_browser = "firefox"
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
    build = "make tiktoken",
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
