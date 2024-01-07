local M = {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
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
  }, {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  }, {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
      require('ibl').setup()
    end
  }, {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                 ,--.                ,----..                                    ____   
               ,--.'|     ,---,.    /   /   \                   ,---,         ,'  , `. 
           ,--,:  : |   ,'  .' |   /   .     :         ,---. ,`--.' |      ,-+-,.' _ | 
        ,`--.'`|  ' : ,---.'   |  .   /   ;.  \       /__./| |   :  :   ,-+-. ;   , || 
        |   :  :  | | |   |   .' .   ;   /  ` ;  ,---.;  ; | :   |  '  ,--.'|'   |  ;| 
        :   |   \ | : :   :  |-, ;   |  ; \ ; | /___/ \  | | |   :  | |   |  ,', |  ': 
        |   : '  '; | :   |  ;/| |   :  | ; | ' \   ;  \ ' | '   '  ; |   | /  | |  || 
        '   ' ;.    ; |   :   .' .   |  ' ' ' :  \   \  \: | |   |  | '   | :  | :  |, 
        |   | | \   | |   |  |-, '   ;  \; /  |   ;   \  ' . '   :  ; ;   . |  ; |--'  
        '   : |  ; .' '   :  ;/|  \   \  ',  /     \   \   ' |   |  ' |   : |  | ,     
        |   | '`--'   |   |    \   ;   :    /       \   `  ; '   :  | |   : '  |/      
        '   : |       |   :   .'    \   \ .'         :   \ | ;   |.'  ;   | |`-'       
        ;   |.'       |   | ,'       `---`            '---"  '---'    |   ;/           
        '---'         `----'                                          '---'            
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
        dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
        dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
        dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
        dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
        dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
        dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
        dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Tag"
        button.opts.hl_shortcut = "Number"
      end
      dashboard.section.header.opts.hl = "Type"
      dashboard.section.buttons.opts.hl = "Tag"
      dashboard.section.footer.opts.hl = "Type"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
}
}

return M
