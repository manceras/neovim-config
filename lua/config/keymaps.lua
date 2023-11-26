local map = vim.keymap.set

map('i', 'jk', '<ESC>')
map('n', '<LEADER>w', ':w<CR>')
map('n', '<LEADER>q', ':q<CR>')
map('n', '<ESC>', ':noh<CR>')
map('n', "<LEADER>fq", ":q!<CR>")

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

local tlsc = require('telescope.builtin')
vim.keymap.set('n', '<LEADER>nn', "<CMD> Neotree action=focus source=filesystem position=current reveal=true <CR>")
vim.keymap.set('n', '<LEADER>ng', "<CDM> Neotree action=focus source=git_status position=current reveal=true<CR>")
vim.keymap.set('n', '<LEADER>ff', tlsc.find_files, {})
vim.keymap.set('n', '<LEADER>fb', tlsc.buffers, {})
vim.keymap.set('n', '<LEADER>fg', tlsc.live_grep, {})

vim.keymap.set('n', '<C-b>n', ':bnext<cr>')
vim.keymap.set('n', '<C-b>p', ':bprevious<cr>')
vim.keymap.set('n', '<C-b>d', ':bdelete<cr>')
