return {
	"ThePrimeagen/harpoon",
    lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
	keys = {
		{ '<leader>a', function () require 'harpoon.mark'.add_file() end, desc = "Add File To Harpoon" },
		{ '<C-e>', function () require 'harpoon.ui'.toggle_quick_menu() end, desc = "Edit Files To Harpoon" },
		{ '<M-j>', function () require 'harpoon.ui'.nav_file(1) end, desc = "Harpoon to file 1" },
		{ '<M-k>', function () require 'harpoon.ui'.nav_file(2) end, desc = "Harpoon to file 2" },
		{ '<M-l>', function () require 'harpoon.ui'.nav_file(3) end, desc = "Harpoon to file 3" },
		{ '<M-;>', function () require 'harpoon.ui'.nav_file(4) end, desc = "Harpoon to file 4" },
	},
}
