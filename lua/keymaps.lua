vim.g.mapleader=' '

vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('n', '<LEADER>w', ':w<CR>')
vim.keymap.set('n', '<LEADER>q', ':q<CR>')
vim.keymap.set('n', '<LEADER>i', ':noh<CR>')
vim.keymap.set('n', "<LEADER>fq", ":q!<CR>")

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

local tlsc = require('telescope.builtin')
require('telescope').load_extension('harpoon')
vim.keymap.set('n', '<LEADER>nn', ":Neotree action=focus source=filesystem position=current reveal=true<CR>")
vim.keymap.set('n', '<LEADER>ng', ":Neotree action=focus source=git_status position=current reveal=true<CR>")
vim.keymap.set('n', '<LEADER>ff', tlsc.find_files, {})
vim.keymap.set('n', '<LEADER>fb', tlsc.buffers, {})
vim.keymap.set('n', '<LEADER>fg', tlsc.live_grep, {})

vim.keymap.set('i', "<C-BS>", "<C-w>")

vim.keymap.set('n', '<C-b>n', ':bnext<cr>')
vim.keymap.set('n', '<C-b>p', ':bprevious<cr>')
vim.keymap.set('n', '<C-b>d', ':bdelete<cr>')

