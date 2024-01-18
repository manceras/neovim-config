local M = {
  {
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    opts = {
      surround = {
        mappings = {
          add = "ys",
          delete = "ds",
          find = "fs",
          find_left = "Fs",
          replace = "cs"
        }
      }
    },
    config = function(_, opts)
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup(_, opts.surround)
      require("mini.operators").setup()
    end
  }, {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        pickers = {
          find_files = {
            find_commands = { "rg", "--files", "--hidden", "-g", "!.git" }
          }
        }
    },
    config = function (_, opts)
      require("telescope").setup(opts)
    end
  }, {
    "jbyuki/nabla.nvim"
  }
}

return M
