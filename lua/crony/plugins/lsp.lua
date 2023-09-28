return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "LspInfo",
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				cmd = "Mason",
			},
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "<leader>vws", "<cmd> lua vim.lsp.buf.workspace_symbol()<cr>", opts)
					vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
					vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
					vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
					vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
					vim.keymap.set("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				end,
			})

			require("mason-lspconfig").setup({})

			local get_servers = require("mason-lspconfig").get_installed_servers
			for _, server_name in ipairs(get_servers()) do
				require("lspconfig")[server_name].setup({})
			end

			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			vim.diagnostic.config({
				signs = true,
				update_in_insert = true,
				underline = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
				},
				severity_sort = true,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
				sources = {
					nls.builtins.formatting.stylua,
				},
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
                "lua-language-server"
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"j-hui/fidget.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		event = { "BufReadPre", "BufNewFile" },
		tag = "legacy",
		config = true,
	},
}
