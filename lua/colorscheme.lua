vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "bold" },
		functions = { "italic"},
		keywords = { "italic"},
		strings = { "italic" },
		variables = { "bold" },
		numbers = { "bold" },
		booleans = { "italic" },
		properties = { "italic" },
		types = {},
		operators = { "bold" },
	},
    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
        },
},
	integrations = {
		cmp = true,
		gitsigns = true,
        dashboard = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
        markdown = true,
        notify = true,
        vimwiki = true,
        which_key = true,
	},
    indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
    },
})

vim.cmd [[colorscheme catppuccin]]
