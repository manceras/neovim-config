return {
  {
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'nord',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {"alpha"},
            winbar = {"alpha"},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {'buffers'}
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },
  {

  },
  { "alvan/vim-closetag" },
  { "tpope/vim-repeat" },
  { "sheerun/vim-polyglot" },
  {
    'echasnovski/mini.comment',
    version = false,
    config = function ()
      require("mini.comment").setup()
    end
  },
  { 'echasnovski/mini.cursorword',
    version = false,
    config = function ()
      require("mini.cursorword").setup()
    end
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function ()
      require("mini.pairs").setup()
    end
  },
  {
    'echasnovski/mini.surround',
    version = false,
    config = function ()
      require("mini.surround").setup {
        mappings = {
          add = "ys",
          delete = "ds",
          find = "fs",
          find_left = "Fs",
        }
      }
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
