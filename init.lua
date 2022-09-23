-- general settings
require("plugins")
require("settings")
require("colorscheme")
require("keymaps")

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
require("nv-presence")
require("nv-telescope")
require("nv-toggleterm")
require("nv-treesitter")
require("nv-whichkey")

-- lsp
require("lsp")

-- vimscript only
vim.cmd("source ~/AppData/Local/nvim/vimscript/functions.vim")
