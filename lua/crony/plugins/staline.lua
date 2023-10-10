return {
	"tamton-aquib/staline.nvim",
	event = { "BufReadPre", "BufNew" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("staline").setup({
			sections = {
				left = {
					"- ",
					"-mode",
					"left_sep_double",
					"file_name",
					"  ",
					"branch",
				},
				mid = { "lsp" },
				right = {
					"cool_symbol",
					"  ",
					vim.bo.fileencoding:upper(),
					"right_sep_double",
					"-line_column",
				},
			},
			defaults = {
				cool_symbol = "  ",
				left_separator = "",
				right_separator = "",
				bg = "#292c3c",
				full_path = false,
				branch_symbol = " ",
			},
			mode_colors = {
				n = "#8caaee",
				i = "#e78284",
				ic = "#e78284",
				c = "#ef9f76",
			},
		})
		require("stabline").setup({
			style = "slant",
			bg = "#8caaee",
			fg = "#292c3c",
			inactive_fg = "#8caaee",
			stab_right = "",
		})
	end,
}
