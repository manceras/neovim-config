return {
  {
      'AlexvZyl/nordic.nvim',
      enabled = false,
      lazy = false,
      priority = 1000,
      config = function()
        require('nordic').setup {
          -- Enable bold keywords.
          bold_keywords = false,
          -- Enable italic comments.
          italic_comments = true,
          -- Enable general editor background transparency.
          transparent_bg = false,
          -- Enable brighter float border.
          bright_border = false,
          -- Reduce the overall amount of blue in the theme (diverges from base Nord).
          reduced_blue = false,
          -- Swap the dark background with the normal one.
          swap_backgrounds = false,
          -- Override the styling of any highlight group.
          override = {},
          -- Cursorline options.  Also includes visual/selection.
          cursorline = {
              -- Bold font in cursorline.
              bold = false,
              -- Bold cursorline number.
              bold_number = true,
              -- Avialable styles: 'dark', 'light'.
              theme = 'light',
              -- Blending the cursorline bg with the buffer bg.
              blend = 0.7,
          },
        }
        require('nordic').load()
      end,
  },
  {
    "shaunsingh/nord.nvim",
    enabled = true,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = true
      require('nord').set()
    end,
  }
}

