vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Move up next line with space in between" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page movement" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page movement" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor in middle with search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor in middle with search" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste while keeping the registry" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format with lsp" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
