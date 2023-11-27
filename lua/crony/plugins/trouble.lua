return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end,           desc = "Toggle trouble" },
    { "<leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Toggle quickfix" },
  },
}
