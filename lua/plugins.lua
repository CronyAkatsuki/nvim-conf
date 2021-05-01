local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()
	-- plugin manager
	use 'wbthomason/packer.nvim'
	-- file explorer
	use 'kyazdani42/nvim-tree.lua'
	-- lsp support
	use 'neovim/nvim-lspconfig'
	-- rust tools
	use 'simrat39/rust-tools.nvim'
	-- telescope
	use "nvim-lua/popup.nvim"
	use 'nvim-lua/plenary.nvim'
	use "nvim-telescope/telescope.nvim"
	use "glepnir/lspsaga.nvim"
	-- completion support
	use 'hrsh7th/nvim-compe'
	use 'hrsh7th/vim-vsnip'
	use 'rafamadriz/friendly-snippets'
	-- debugging
	use "mfussenegger/nvim-dap"
	-- tree sitter
	use "nvim-treesitter/nvim-treesitter"
	use 'windwp/nvim-ts-autotag'
	-- autopairs
	use 'windwp/nvim-autopairs'
	-- Icons
	use "kyazdani42/nvim-web-devicons"
	-- easy commenting
	use "terrortylor/nvim-comment"
	-- nice line
	use 'glepnir/galaxyline.nvim'
	-- git signs
	use 'lewis6991/gitsigns.nvim'
	use 'glepnir/dashboard-nvim'
	use 'kevinhwang91/nvim-bqf'
	-- colors are mine
	use 'norcalli/nvim-colorizer.lua'
	-- theme
	use {'dracula/vim', as =  'dracula'}
	-- buffer line
	use 'jose-elias-alvarez/buftabline.nvim'
	-- terminal toggle
	use 's1n7ax/nvim-terminal'
	-- zen mode
	use "kdav5758/TrueZen.nvim"
	-- rainbow parantheses
	use "p00f/nvim-ts-rainbow"
end)
