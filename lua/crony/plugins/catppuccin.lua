return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		integrations = {
			alpha = true,
			bufferline = true,
			cmp = true,
			gitsigns = true,
			harpoon = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			markdown = true,
			mason = true,
			mini = true,
			neotree = true,
			dap = {
				enabled = true,
				enable_ui = true, -- enable nvim-dap-ui
			},
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
            notify = true,
			telescope = true,
            lsp_trouble = true,
			treesitter = true,
			which_key = true,
		},
	},
}
