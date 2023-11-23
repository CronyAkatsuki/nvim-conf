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
        -- stylua: ignore
        callback = function(event)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
            { buffer = event.buf, desc = "Go to definition" })
          vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>",
            { buffer = event.buf, desc = "Simple Hover Info" })
          vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>",
            { buffer = event.buf, desc = "Diagnostics Preview" })
          vim.keymap.set("n", "l[", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            { buffer = event.buf, desc = "Diagnostics previous" })
          vim.keymap.set("n", "l]", "<cmd>lua vim.diagnostic.goto_next()<cr>",
            { buffer = event.buf, desc = "Diagnostics Next" })
          vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",
            { buffer = event.buf, desc = "Run Code Actions" })
          vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>",
            { buffer = event.buf, desc = "List References" })
          vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>",
            { buffer = event.buf, desc = "Rename whatever this does" })
          vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            { buffer = event.buf, desc = "Check hover help" })
        end,
			})

			require("mason-lspconfig").setup({})

			local get_servers = require("mason-lspconfig").get_installed_servers
			for _, server_name in ipairs(get_servers()) do
				require("lspconfig")[server_name].setup({})
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
		"nvimtools/none-ls.nvim",
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
		keys = { { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"lua-language-server",
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
		opts = {
			window = {
				blend = 0,
			},
		},
	},
}
