return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "▎" },
			topdelete = { text = "▎" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

      -- stylua: ignore start
      map("n", "]g", gs.next_hunk, "Next git hunk")
      map("n", "[g", gs.prev_hunk, "Previous git hunk")
      map("n", "<leader>gh", gs.reset_hunk, "Reset Git Hunk")
      map("n", "<leader>gr", gs.reset_buffer, "Reset Git Buffer")
      map("n", "<leader>gs", gs.stage_hunk, "Stage Git Hunk")
      map("n", "<leader>gS", gs.stage_buffer, "Stage Git Buffer")
      map("n", "<leader>gu", gs.undo_stage_hunk, "UnStage Git Hunk")
      map("n", "<leader>gd", gs.diffthis, "View Git Diff")
		end,
	},
}
