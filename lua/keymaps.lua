-- leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- better window movement
vim.api.nvim_set_keymap('n', '<C-left>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-down>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-up>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-right>', '<C-w>l', { silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- buffer movement with tab
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprev<CR>', { noremap = true, silent = true })
