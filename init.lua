-- general settings
require("settings")
require("colorscheme")
require("keymaps")
require("plugins")

-- plugin settings
require("nv-autopairs")
require("nv-barbar")
require("nv-cmp")
require("nv-colorizer")
require("nv-comment")
require("nv-dashboard")
require("nv-gitsigns")
require("nv-indentline")
require("nv-lualine")
require("nv-null-ls")
require("nv-nvimtree")
require("nv-toggleterm")
require("nv-treesitter")

-- lsp
require("lsp")

-- vimscript only
vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
