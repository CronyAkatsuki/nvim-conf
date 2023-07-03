return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ '<leader>a', function () require 'harpoon.mark'.add_file() end, desc = "Add File To Harpoon" },
		{ '<C-e>', function () require 'harpoon.ui'.toggle_quick_menu() end, desc = "Edit Files To Harpoon" },
		{ '<C-j>', function () require 'harpoon.ui'.nav_file(1) end, desc = "Harpoon to file 1" },
		{ '<C-k>', function () require 'harpoon.ui'.nav_file(2) end, desc = "Harpoon to file 2" },
		{ '<C-l>', function () require 'harpoon.ui'.nav_file(3) end, desc = "Harpoon to file 3" },
		{ '<C-;>', function () require 'harpoon.ui'.nav_file(4) end, desc = "Harpoon to file 4" },
	},
}
