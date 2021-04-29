-- general settings
require('plugins')
require('keymaps')
require('settings')
require('colorscheme')

-- plugin settings
require('nv-autopairs')
require('nv-barbar')
require('nv-colorizer')
require('nv-comment')
require('nv-compe')
require('nv-dashboard')
require('nv-galaxyline')
require('nv-gitsigns')
require('nv-nvimtree')
require('nv-telescope')
require('nv-treesitter')
require('nv-utils')

-- lsp
require('lsp')
require('lsp.bash-ls')
require('lsp.cpp-ls')
require('lsp.css-ls')
require('lsp.lua-ls')

-- vimscript only
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
