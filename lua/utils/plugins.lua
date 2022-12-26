local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Automatically run :PackerSync whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerSync',
})

return packer.startup(function()
  use "wbthomason/packer.nvim" --> update itself

  use "lewis6991/impatient.nvim"  --> Make nvim faster
	use "fladson/vim-kitty"  --> kitty terminal syntax highlighting

  use { "catppuccin/nvim", as = "catppuccin" } --> theme
	use "nvim-lualine/lualine.nvim" --> nice status line
	use "kyazdani42/nvim-tree.lua" --> file explorer
  use { "folke/which-key.nvim", config = function () require("which-key").setup() end } --> help for my forgeting brain
	use { "rcarriga/nvim-notify", config = function () vim.notify = require("notify") end } --> notifications
  use "glepnir/dashboard-nvim"

  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" } --> nice tabline

  use "norcalli/nvim-colorizer.lua" --> colors

	use "williamboman/mason.nvim" --> installer for the lsp's
  use "williamboman/mason-lspconfig.nvim" --> automatic lsp setups
	use "neovim/nvim-lspconfig" --> lsp config
  use { "j-hui/fidget.nvim", config = function () require("fidget").setup() end } --> nice lsp info

	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} --> Treesitter support

	use "lukas-reineke/indent-blankline.nvim" --> indent line

  use "dcampos/nvim-snippy" --> snipperts
	use "onsails/lspkind-nvim" --> kind icons for completion
	use "hrsh7th/nvim-cmp" --> Autocompletion plugin
	use "hrsh7th/cmp-nvim-lsp" --> LSP source for nvim-cmp
	use "hrsh7th/cmp-buffer" --> Buffer source for nvim-cmp
	use "hrsh7th/cmp-path" --> Path source for nvim-cmp
	use "hrsh7th/cmp-cmdline" --> cmdline source for nvim-cmp
  use "dcampos/cmp-snippy" --> cmp snippy support
	use "ray-x/cmp-treesitter" --> treesitter autocompletion support

	use "windwp/nvim-autopairs" --> great autopair support

	use "terrortylor/nvim-comment" --> better commenting

	use "lewis6991/gitsigns.nvim" --> git sings to show you what you changed you sneaky little bastard

  use "jakewvincent/mkdnflow.nvim"

	use "nvim-telescope/telescope-ui-select.nvim" --> telescope picker
  use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" } --> telescope

  use "numToStr/FTerm.nvim" -- simple floating terminal

  use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim", config = function () require("neogit").setup() end } --> git client

  use "sindrets/diffview.nvim" --> diff view

  use "dstein64/vim-startuptime" --> just for fun

  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
end)
