DefaultTerminal = require('nvim-terminal').DefaultTerminal;

terminal = DefaultTerminal
local silent = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
