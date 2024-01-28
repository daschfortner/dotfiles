-- Personal keymappings

vim.g.mapleader = ' '

vim.keymap.set('n', ';', ':')
vim.keymap.set({ 'i', 'c', 'v' }, 'kj', '<Esc>')

-- General settings

vim.opt.guicursor = ''

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.syntax = 'on'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = '80'

require('setup-lazy')

-- Plugin specific controls

vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')

vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)

-- Auto format on save

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
