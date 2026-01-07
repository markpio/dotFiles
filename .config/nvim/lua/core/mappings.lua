
vim.g.mapleader = " "

vim.keymap.set( "n", "-", vim.cmd.Ex )
vim.keymap.set( 'n', '<CR>', "<CMD>nohl<CR>", { desc = 'Clear highlighting' } )
vim.keymap.set( 'n', '<leader>x', "<CMD>bdelete<CR>", { desc = 'Close current buffer' } )
vim.keymap.set( 'n', '<leader>', "<CMD>noautocmd write<CR>", { desc = 'Write buffer without autocmds' } )

-- Telescope bindings
local telescope_builtin = require( 'telescope.builtin' )

vim.keymap.set( 'n', '<leader>fw', telescope_builtin.live_grep, { desc = 'Telescope live grep' } )
vim.keymap.set( 'n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' } )
vim.keymap.set( 'n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope find files' } )
vim.keymap.set( 'n', '<leader>fz', telescope_builtin.current_buffer_fuzzy_find, { desc = 'Telescope Fuzzy Find in current buffer' } )
vim.keymap.set( 'n', '<leader>fc', telescope_builtin.colorscheme, { desc = 'Telescope color schemes' } )


-- Splits
vim.keymap.set( 'n', '<leader>-', '<cmd>sp<CR>', { desc = 'Horizontal split' } )
vim.keymap.set( 'n', '<leader>\\', '<cmd>vsp<CR>', { desc = 'Vertical split' } )

vim.keymap.set( 'n', '<leader>h', '<cmd>wincmd h<CR>', { desc = 'Move left' } )
vim.keymap.set( 'n', '<leader>l', '<cmd>wincmd l<CR>', { desc = 'Move right' } )
vim.keymap.set( 'n', '<leader>j', '<cmd>wincmd j<CR>', { desc = 'Move down' } )
vim.keymap.set( 'n', '<leader>k', '<cmd>wincmd k<CR>', { desc = 'Move up' } )

vim.keymap.set( 'v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' } )
vim.keymap.set( 'v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' } )

-- LSP
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
vim.keymap.set('v', '<leader>ca', function()
  vim.lsp.buf.code_action()
end, { desc = 'LSP Code Action (Visual Range)' })
vim.keymap.set( 'n', '<leader>gd', "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = 'Goto Declaration' } )

-- git
vim.keymap.set( 'n', '<leader>gs', telescope_builtin.git_status, { desc = 'Telescope git status' } )
vim.keymap.set( 'n', '<leader>co', '<cmd>Git checkout %<CR>', { desc = 'Git Checkout current file' } )
