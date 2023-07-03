return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	cmd = 'Telescope',
	ft = 'mason',
	keys = {
		{ '<leader>pf', function () require 'telescope.builtin'.find_files() end, desc = "Find all files in directory" },
		{ '<C-p>', function () require 'telescope.builtin'.git_files() end, desc = "Find git files in directory" },
	}
}
