local M = {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.pairs").setup({
        mappings = {
          [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
        }
      })
      require("mini.surround").setup()
      require("mini.operators").setup()
    end
  }, {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!node_modules" }
        },
        git_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!node_modules" }
        }
      }
    },
    config = function (_, opts)
      require("telescope").setup(opts)
    end
  }, {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}

return M
