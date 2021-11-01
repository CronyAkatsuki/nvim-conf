-- general settings
require('settings')
require('keymaps')
require('plugins')
require('colorscheme')

-- plugin settings
require('nv-autopairs')
require('nv-bufferline')
require('nv-cmp')
require('nv-colorizer')
require('nv-comment')
require('nv-dashboard')
require('nv-devicons')
require('nv-gitsigns')
-- require('nv-lspinstall')
require('nv-lualine')
require('nv-nvimtree')
require('nv-telescope')
require('nv-toggleterm')
require('nv-treesitter')

-- lsp
require('lsp')
-- require('lsp.bash-ls')
-- require('lsp.cpp-ls')
require('lsp.css-ls')
-- require('lsp.golang-ls')
require('lsp.html-ls')
require('lsp.js-ts-ls')
-- require('lsp.json-ls')
-- require('lsp.latex-ls')
require('lsp.lua-ls')
require('lsp.powershell-ls')
require('lsp.php-ls')
require('lsp.python-ls')
-- require('lsp.ruby-ls')
-- require('lsp.rust-ls')
-- require('lsp.vim-ls')
-- require('lsp.yaml-ls')

-- vimscript only
-- linux
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
-- windows
vim.cmd('source ~/AppData/Local/nvim/vimscript/functions.vim')
