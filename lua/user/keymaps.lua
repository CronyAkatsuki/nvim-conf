local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--> leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

--> no hl
map("n", "<Leader>h", ":set hlsearch!<CR>", opts)

--> close buffer
map("n", "<Leader>qb", ":bd<CR>", opts)

--> close tab
map("n", "<Leader>qt", ":tabclose<CR>", opts)

--> better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Telescope mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Nerd Tree
map('n', '<leader>e', ":NvimTreeToggle<CR>", opts)

-- FTerm keybindings
map('n', '<leader>t', ':FTermToggle<CR>', opts)

--> diffview
map("n", "<Leader>gd", ":DiffviewOpen<CR>", opts)

--> neogit
map("n", "<Leader>gg", ":Neogit<CR>", opts)
