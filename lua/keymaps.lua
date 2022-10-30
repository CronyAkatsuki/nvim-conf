local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--> leader key
vim.g.mapleader = " "

--> no hl
map("n", "<Leader>h", ":set hlsearch!<CR>", opts)

--> explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

--> diffview
map("n", "<Leader>gd", ":DiffviewOpen<CR>", opts)

--> neogit
map("n", "<Leader>gg", ":Neogit<CR>", opts)

--> close buffer
map("n", "<Leader>qb", ":bd<CR>", opts)

--> close tab
map("n", "<Leader>qt", ":tabclose<CR>", opts)

--> better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

--> terminal keymaps
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- Lsp install info
map("n", "<leader>lif", ":LspInstallInfo<CR>", opts)
