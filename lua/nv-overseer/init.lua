require('overseer').setup()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--> task list
map("n", "<Leader>ot", ":OverseerToggle<CR>", opts)

--> run command
map("n", "<Leader>or", ":OverseerRunCmd<CR>", opts)

--> recent task actions
map("n", "<Leader>oa", ":OverseerTaskAction<CR>", opts)

--> load tasks bundle
map("n", "<Leader>ob", ":OverseerLoadBundle<CR>", opts)
