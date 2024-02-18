local map = vim.keymap.set

-- QOL keymaps
-- map('i', 'jk', '<ESC>')
map('n', '<ESC>', ':noh<CR>')
map('n', '<Leader>t', '<cmd>e term://fish<cr>')


-- Open telescope
local tlsc = require('telescope.builtin')
map('n', '<Leader>f', tlsc.find_files, {})
map('n', '<Leader>b', tlsc.buffers, {})
map('n', '<Leader>g', tlsc.live_grep, {})
map('n', '<Leader>F', tlsc.git_files, {})

-- Move around buffers
map('n', 'gn', '<cmd>bn<cr>')
map('n', 'gp', '<cmd>bp<cr>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')


-- Clipboard
map('v', '<Leader>y', '"+y')
map('n', '<Leader>y', '"+y')
map('n', '<Leader>p', '"+p')
map('v', '<Leader>p', '"+p')

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


-- LuaSnip
local opts = { noremap = true, silent = true }
map('i', '<C-l>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
map('s', '<C-l>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
map('i', '<C-h>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)
map('s', '<C-h>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)

-- Harpoon
local harpoon = {
  mark = require('harpoon.mark'),
  ui = require('harpoon.ui'),
}
map('n', '<Leader>ha', harpoon.mark.add_file)
map('n', '<Leader>hh', harpoon.ui.toggle_quick_menu)
map('n', '<Leader>hn', harpoon.ui.nav_next)
map('n', '<Leader>hp', harpoon.ui.nav_prev)
-- Telescope support
require('telescope').load_extension('harpoon')
map('n', '<Leader>ht', '<cmd>Telescope harpoon marks<cr>')
