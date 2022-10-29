return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> update itself

    use { "catppuccin/nvim", as = "catppuccin" } --> theme
    use("folke/which-key.nvim") --> help for my forgeting brain

	use("kyazdani42/nvim-web-devicons") --> icons
	use("nvim-lualine/lualine.nvim") --> nice status line
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	use("kyazdani42/nvim-tree.lua") --> file explorer

	use("neovim/nvim-lspconfig") --> lsp config
	use("williamboman/mason.nvim") --> installer for the lsp's
    use("williamboman/mason-lspconfig.nvim")

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

	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) --> telescope
	use("nvim-telescope/telescope-ui-select.nvim") --> telescope picker
    use("nvim-telescope/telescope-file-browser.nvim") --> telescope file browser

	use("norcalli/nvim-colorizer.lua") --> colors preview

	use("lukas-reineke/indent-blankline.nvim") --> indent line

	use("akinsho/toggleterm.nvim") --> terminal toggle

	use("terrortylor/nvim-comment") --> better commenting

	use("windwp/nvim-autopairs") --> great autopair support

	use("lewis6991/gitsigns.nvim") --> git sings to show you what you changed you sneaky little bastard

	use("fladson/vim-kitty") --> kitty terminal syntax highlighting

	use("glepnir/dashboard-nvim") --> nice start page
	use("kevinhwang91/nvim-bqf")

	use("andweeb/presence.nvim") --> discord rich present

    use("vimwiki/vimwiki") --> lets make a wiki
end)
