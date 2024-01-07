local map = vim.keymap.set

-- QOL keymaps
--map('i', 'jk', '<ESC>')
--map('n', '<LEADER>w', ':w<CR>')
--map('n', '<LEADER>q', ':q<CR>')
map('n', '<ESC>', ':noh<CR>')
--map('n', "<LEADER>fq", ":q!<CR>")


-- Open telescope
local tlsc = require('telescope.builtin')
map('n', '<LEADER>nn', "<CMD> Neotree action=focus source=filesystem position=current reveal=true <CR>")
map('n', '<LEADER>ng', "<CDM> Neotree action=focus source=git_status position=current reveal=true<CR>")
map('n', '<LEADER>ff', tlsc.find_files, {})
map('n', '<LEADER>fb', tlsc.buffers, {})
map('n', '<LEADER>fg', tlsc.live_grep, {})

-- Move around buffers
map('n', '<C-b>n', ':bnext<cr>')
map('n', '<C-b>p', ':bprevious<cr>')
map('n', '<C-b>d', ':bdelete<cr>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    map('n', ',rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    map('n', ',ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    map('n', ',e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})
