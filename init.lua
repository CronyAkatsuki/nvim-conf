-- Speedup
require('impatient')

-- general settings
require("utils.plugins")
require("utils.colorscheme")
require("user.builtins")
require("user.settings")
require("user.keymaps")
require("user.functions")

-- vimscript only
vim.cmd("source ~/.config/nvim/vimscript/functions.vim")
vim.cmd("source ~/.config/nvim/vimscript/vimwiki.vim")
