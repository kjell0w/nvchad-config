---@diagnostic disable: different-requires
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    {
      "glepnir/lspsaga.nvim",
      opts = {
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
      },
      config = true,
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    ft = {
      "markdown",
      "lua",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "html",
      "css",
      "astro",
      "svelte",
    },
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "css-lsp",
        "html-lsp",
        "astro-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "deno",
        "prettier",
        "json-lsp",
        "marksman",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = "ahmedkhalf/project.nvim",
    opts = overrides.telescope,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    ft = {
      "markdown",
      "lua",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "html",
      "css",
      "astro",
      "svelte",
    },
    treesitter = true,
    dimming = {
      alpha = 0.25,
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    run = "cd app && pnpm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.presence"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "olacin/telescope-gitmoji.nvim",
  },
}

return plugins
