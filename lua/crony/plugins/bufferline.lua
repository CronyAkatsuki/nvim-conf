return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	opts = {
		options = {
            -- stylua: ignore
            highlights = function() require('catppuccin.groups.integrations.bufferline').get() end,
			numbers = "ordinal",
            -- stylua: ignore
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            -- stylua: ignore
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
			show_buffer_close_icons = false,
		},
	},
}
