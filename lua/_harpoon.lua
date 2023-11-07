require('harpoon').setup({
    global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,

      -- enable tabline with harpoon marks
      tabline = false,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    },
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
  })

vim.keymap.set('n', "<LEADER>ha", require('harpoon.mark').add_file)
vim.keymap.set('n', "<LEADER>hn", require('harpoon.ui').nav_next)
vim.keymap.set('n', "<LEADER>hp", require('harpoon.ui').nav_prev)
vim.keymap.set('n', '<LEADER>hm', require('harpoon.ui').toggle_quick_menu)
vim.keymap.set('n', '<LEADER>h1', function() require('harpoon.ui').nav_file(1) end)
vim.keymap.set('n', '<LEADER>h2', function() require('harpoon.ui').nav_file(2) end)
vim.keymap.set('n', '<LEADER>h3', function() require('harpoon.ui').nav_file(3) end)
vim.keymap.set('n', '<LEADER>h4', function() require('harpoon.ui').nav_file(4) end)

