local key = vim.keymap.set

vim.g.mapleader = " "
key("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
key("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })

key("n", "J", "mzJ`z", { desc = "Move up next line with space in between" })
key("n", "<C-d>", "<C-d>zz", { desc = "Half page movement" })
key("n", "<C-u>", "<C-u>zz", { desc = "Half page movement" })
key("n", "n", "nzzzv", { desc = "Keep cursor in middle with search" })
key("n", "N", "Nzzzv", { desc = "Keep cursor in middle with search" })

-- greatest remap ever
key("x", "<leader>p", [["_dP]], { desc = "Paste while keeping the registry" })

key("n", "<leader>f", vim.lsp.buf.format, { desc = "Format with lsp" })

key(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Simple find and replace of current word" }
)

key("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Better window navigation
key("n", "<C-h>", "<C-w>h")
key("n", "<C-j>", "<C-w>j")
key("n", "<C-k>", "<C-w>k")
key("n", "<C-l>", "<C-w>l")

-- Resize with arrows
key("n", "<C-Up>", ":resize -2<CR>")
key("n", "<C-Down>", ":resize +2<CR>")
key("n", "<C-Left>", ":vertical resize -2<CR>")
key("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
key("n", "<S-l>", ":bnext<CR>")
key("n", "<S-h>", ":bprevious<CR>")

-- better indenting
key("v", "<", "<gv")
key("v", ">", ">gv")

-- Plugin manager
key("n", "<leader>pi", function()
	require("lazy").install()
end, { desc = "Plugin install" })
key("n", "<leader>ps", function()
	require("lazy").home()
end, { desc = "Plugin status" })
key("n", "<leader>pS", function()
	require("lazy").sync()
end, { desc = "Plugin Sync" })
