return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "rust", "toml" })
			end
		end,
	},
	{
		-- Ensure C/C++ debugger and lsp are installed
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "rust-analyzer" })
			end
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = "neovim/nvim-lspconfig",
		ft = { "rs" },
	},
}
