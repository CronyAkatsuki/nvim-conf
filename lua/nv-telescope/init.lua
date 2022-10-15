local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension "file_browser"

-- Telescope mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fe", ":Telescope file_browser<CR>", opts)
