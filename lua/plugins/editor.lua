return {
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
    config = function ()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup {
        mappings = {
          add = "ys",
          delete = "ds",
          find = "fs",
          find_left = "Fs",
          replace = "cs"
        }
      }
      require("mini.operators").setup()
      require("mini.animate").setup()
    end
  }, {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
