return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,	
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	opts = {
		highlight = { enable = true, },
		indent = { enable = true, },
		ensure_installed = { "c", "lua", "bash" },

		sync_install = true,

		auto_install = true,
	},
	config =  function (_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
