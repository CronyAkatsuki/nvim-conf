-- general settings
require("plugins")
require("settings")
require("colorscheme")
require("keymaps")
require("functions")

-- plugin settings
require("nv-autopairs")
require("nv-bufferline")
require("nv-cmp")
require("nv-colorizer")
require("nv-comment")
require("nv-dashboard")
require("nv-gitsigns")
require("nv-indentline")
require("nv-lualine")
require("nv-neogit")
require("nv-mason")
require("nv-nvimtree")
require("nv-presence")
require("nv-telescope")
require("nv-toggleterm")
require("nv-treesitter")
require("nv-whichkey")

-- lsp
require("lsp")

-- vimscript only
vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
vim.cmd("source ~/.config/nvim/vimscript/vimwiki.vim")
