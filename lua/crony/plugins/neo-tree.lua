return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Neotree",
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	opts = {
		auto_clean_after_session_restore = true,
		close_if_last_window = true,
		sources = { "filesystem", "buffers", "git_status" },
		source_selector = {
			winbar = true,
			content_layout = "center",
			sources = {
				{ source = "filesystem", display_name = "" },
				{ source = "buffers", display_name = "󰈙" },
				{ source = "git_status", display_name = "󰊢" },
				{ source = "gignostics", display_name = "󰒡" },
			},
		},
		default_component_configs = {
			indent = { padding = 0 },
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				folder_empty_open = "",
				default = "󰈙",
			},
			modified = { symbol = "" },
			git_status = {
				symbols = {
					added = "",
					deleted = "",
					modified = "",
					renamed = "󰁕",
					untracked = "★",
					ignored = "◌",
					unstaged = "✗",
					staged = "✓",
					conflict = "",
				},
			},
		},
		window = {
			width = 30,
			mappings = {
				["<space>"] = false,
				["[b"] = "prev_source",
				["]b"] = "next_source",
				o = "open",
			},
			fuzzy_finder_mappings = {
				["<C-j>"] = "move_cursor_down",
				["<C-k>"] = "move_cursor_up",
			},
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(_)
						vim.opt_local.signcolumn = "auto"
					end,
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle<cr>",
			desc = "Toggle Explorer",
		},
		{
			"<leader>o",
			function()
				if vim.bo.filetype == "neo-tree" then
				  vim.cmd.wincmd "p"
				else
				  vim.cmd.Neotree "focus"
				end
			end,
			desc = "Toggle Explorer Focus",
		},
	},
}
