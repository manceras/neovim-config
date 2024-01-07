local M = {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
              accept = '<C-e>'
            }
          },
          panel = { enabled = false },
        })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}

return M
