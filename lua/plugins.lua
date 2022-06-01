return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> update itself

	use("NTBBloodbath/doom-one.nvim") --> theme
    use("catppuccin/nvim") --> theme

	use("kyazdani42/nvim-web-devicons") --> icons
	use("nvim-lualine/lualine.nvim") --> nice status line
	use("romgrk/barbar.nvim") --> buffer/tab bar

	use("kyazdani42/nvim-tree.lua") --> file explorer

	use("neovim/nvim-lspconfig") --> lsp config
	use("williamboman/nvim-lsp-installer") --> installer for the lsp's
	use("simrat39/rust-tools.nvim") --> rust additional tools
	use("mfussenegger/nvim-dap") --> debugging

	use("nvim-lua/plenary.nvim") --> lua functions library

	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") --> Snippets plugin
	use("hrsh7th/cmp-buffer") --> Buffer source for nvim-cmp
	use("hrsh7th/cmp-path") --> Path source for nvim-cmp
	use("hrsh7th/cmp-cmdline") --> cmdline source for nvim-cmp
	use("ray-x/cmp-treesitter") --> treesitter autocompletion support
	use("onsails/lspkind-nvim") --> kind icons for completion

	use("rcarriga/nvim-notify") --> notifications

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> Treesitter support
	use("nvim-treesitter/nvim-treesitter-refactor") --> refactoring support
    use("windwp/nvim-ts-autotag") --> autotagging support

	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) --> telescope
	use({ "nvim-telescope/telescope-ui-select.nvim" }) --> telescope picker

	use("norcalli/nvim-colorizer.lua") --> colors preview

	use("lukas-reineke/indent-blankline.nvim") --> indent line

	use({ "akinsho/toggleterm.nvim" }) --> terminal toggel

	use("terrortylor/nvim-comment") --> better commenting

	use("windwp/nvim-autopairs") --> great autopair support

	use("lewis6991/gitsigns.nvim") --> git sings to show you what ypu changed you sneaky little bastard

	use("jghauser/mkdir.nvim") --> create directory on save if it doesnt exist

	use("fladson/vim-kitty") --> kitty terminal syntax highlighting

	use("glepnir/dashboard-nvim") --> nice start page
	use("kevinhwang91/nvim-bqf")

	use("jose-elias-alvarez/null-ls.nvim") --> additional support for lsp

	use("mattn/emmet-vim") --> better web development
end)
