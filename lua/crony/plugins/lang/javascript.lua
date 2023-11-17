return {
	{
		-- Ensure C/C++ debugger and lsp are installed
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "eslint-lsp", "typescript-language-server", "prettier" })
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "css" })
			end
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			if type(opts.sources) == "table" then
				vim.list_extend(opts.sources, { nls.builtins.formatting.prettier })
			end
		end,
	},
}
