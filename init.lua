-- Config for both neovim and VSCode Neovim:
require('settings')
require('keymaps')
-- Configs only for Neovim:
require('plugins')
require('languages')
require('_cmp')
require('themes')
require('_lualine')
require('markdown')
require('nord_mod')
require('vim-vsnip')
require('_harpoon')
require('indent_blankline')
require('_gitsigns')
require('treesitter')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
