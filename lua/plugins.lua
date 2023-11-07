return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use "neanias/everforest-nvim"
  use "tanvirtin/monokai.nvim"
  use "netsgnut/arctheme.vim"

  use "nordtheme/vim"

  use "nvim-lualine/lualine.nvim"
  use "xiyaowong/transparent.nvim"

  use 'filNaj/tree-setter'

  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'
  use "mattn/emmet-vim"
  use "alvan/vim-closetag"
  use "jiangmiao/auto-pairs"

  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "tpope/vim-commentary"

  use "sheerun/vim-polyglot"

  use "stevearc/vim-arduino"

  use "RRethy/vim-hexokinase"


  use {
    "lukas-reineke/indent-blankline.nvim",
    requires = {"nvim-treesitter/nvim-treesitter"}
  }

  -- use "nvim-tree/nvim-tree.lua"
  -- use "nvim-tree/nvim-web-devicons"

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'ThePrimeagen/harpoon',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
  'mrcjkb/haskell-tools.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'sudormrfbin/cheatsheet.nvim'
  use({
    "epwalsh/obsidian.nvim",
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        dir = "~/Documents/Obsidian/Mis cosas/",

        -- see below for full list of options 👇
      })
    end,
  })


  use "lewis6991/gitsigns.nvim"
  use { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      require('copilot').setup({
          panel = {
            keymap = {
              open = "<A-BS>"
            }
          },
          sugestion = {
            auto_trigger = true,
            keymap = {
              accept = "<A-Space>"
            }
          }
        })
    end
  }

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}
end)
