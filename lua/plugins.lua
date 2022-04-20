return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- theme
	use("NTBBloodbath/doom-one.nvim")

	-- file explorer
	use("kyazdani42/nvim-tree.lua")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- lsp support
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	-- autocompletion section
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("hrsh7th/cmp-buffer") -- Buffer source for nvim-cmp
	use("hrsh7th/cmp-path") -- Path source for nvim-cmp
	use("hrsh7th/cmp-cmdline") -- cmdline source for nvim-cmp

	-- kind Icons
	use("onsails/lspkind-nvim")

	-- notifications
	use("rcarriga/nvim-notify")

	-- nice line
	use("nvim-lualine/lualine.nvim")

	-- nice bar
	use("romgrk/barbar.nvim")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- telescope
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })

	-- colors are mine
	use("norcalli/nvim-colorizer.lua")

	-- indentline
	use("lukas-reineke/indent-blankline.nvim")

	-- terminal toggle
	use({ "akinsho/toggleterm.nvim" })

	-- easy commenting
	use("terrortylor/nvim-comment")

	-- autopairs
	use("windwp/nvim-autopairs")

	-- git signs
	use("lewis6991/gitsigns.nvim")

	-- automatically create directory on save
	use("jghauser/mkdir.nvim")

	-- kitty term config highlights
	use("fladson/vim-kitty")

	-- nice start page
	use("glepnir/dashboard-nvim")
	use("kevinhwang91/nvim-bqf")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")
end)

-- return require('packer').startup(function()
--      -- rainbow parantheses
--      use "p00f/nvim-ts-rainbow"
-- end
