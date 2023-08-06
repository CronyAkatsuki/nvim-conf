return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	opts = {
		ensure_installed = { "c", "lua", "bash" },
		sync_install = true,
		autotag = {
			enable = true,
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		indent = { enable = true },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
