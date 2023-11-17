return {
	{
		-- Ensure C/C++ debugger and lsp are installed
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"gopls",
					"delve",
					"goimports-reviser",
					"gofumpt",
					"golines",
					"gomodifytags",
					"impl",
					"gotests",
					"iferr",
				})
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum" })
			end
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			if type(opts.sources) == "table" then
				vim.list_extend(opts.sources, {
					nls.builtins.formatting.gofumpt,
					nls.builtins.formatting.goimports_reviser,
					nls.builtins.formatting.golines,
				})
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"leoluz/nvim-dap-go",
      -- stylua: ignore
      keys = {
        { "<leader>dGt", function() require("dap-go").debug_test() end,      desc = "Debug Method" },
        { "<leader>dGt", function() require("dap-go").debug_last_test() end, desc = "Repeat Last Method Debug" }
      },
			config = function()
				require("dap-go").setup()
			end,
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							complete_unimported = true,
							usePlaceholders = true,
							analyses = {
								unusedparams = true,
							},
						},
					},
				},
			},
		},
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		keys = {
			{ "<leader>gsj", ":GoTagAdd json <cr>", desc = "Add json struct tags" },
			{ "<leader>gsy", ":GoTagAdd yaml <cr>", desc = "Add json struct tags" },
		},
	},
}
