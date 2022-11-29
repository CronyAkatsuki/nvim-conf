-- Speedup
require('impatient')

-- general settings
require("utils.plugins")
require("utils.colorscheme")
require("user.builtins")
require("user.diagnostics")
require("user.functions")
require("user.keymaps")
require("user.settings")

-- plgins
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.dashboard")
require("plugins.fterm")
require("plugins.gitsigns")
require("plugins.indent_blankline")
require("plugins.lualine")
require("plugins.mason")
require("plugins.mkdnflow")
require("plugins.nvim-autopairs")
require("plugins.nvim-cmp")
require("plugins.nvim-comment")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.telescope")

-- lsp
require("lsp")
