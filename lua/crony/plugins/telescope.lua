return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable("make") == 1, build = "make" },
	},
	cmd = "Telescope",
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				git_worktrees = vim.g.git_worktrees,
				prompt_prefix = "❯",
				selection_caret = "❯",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55 },
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = { q = actions.close },
				},
			},
		}
	end,
	keys = {
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches({ use_file_path = true })
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_commits({ use_file_path = true })
			end,
			desc = "Git Commits (Repository)",
		},
		{
			"<leader>gC",
			function()
				require("telescope.builtin").git_bcommits({ use_file_path = true })
			end,
			desc = "Git Commits (Current File)",
		},
		{
			"<leader>gt",
			function()
				require("telescope.builtin").git_status({ use_file_path = true })
			end,
			desc = "Git status",
		},
		{
			"<leader>f/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find words in current buffer",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find word under cursor",
		},
		{
			"<leader>fC",
			function()
				require("telescope.builtin").commands()
			end,
			desc = "Find Commands",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
			end,
			desc = "Find All Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find Help",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find Keymaps",
		},
		{
			"<leader>fm",
			function()
				require("telescope.builtin").man_pages()
			end,
			desc = "Find Man Pages",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find Words",
		},
		{
			"<leader>fW",
			function()
				require("telescope.builtin").live_grep({ additianal_args = { "--hidden", "--no-ignore" } })
			end,
			desc = "Find Words In All Words",
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension "fzf"
	end,
}
