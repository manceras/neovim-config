local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
          selection_modes = {
            ["@function.outer"] = 'v',
            ["@function.inner"] = 'v',
            ["@class.outer"] = 'v',
            ["@class.inner"] = 'v',
            ["@block.outer"] = 'v',
            ["@block.inner"] = 'v',
            ["@loop.outer"] = 'v',
            ["@loop.inner"] = 'v',
            ["@parameter.outer"] = 'v',
            ["@parameter.inner"] = 'v',
          }
        },
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }, {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter'
  }
}

return M

