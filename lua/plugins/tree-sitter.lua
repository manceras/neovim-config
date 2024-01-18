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
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}

return M
