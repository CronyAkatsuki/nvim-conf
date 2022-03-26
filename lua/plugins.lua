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
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'ray-x/cmp-treesitter'
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-nvim-lua'

		-- snippets
		use 'dcampos/nvim-snippy'
		use 'dcampos/cmp-snippy'

		-- kind Icons
		use 'onsails/lspkind-nvim'

		-- debugging
		use 'mfussenegger/nvim-dap'
		use 'theHamsta/nvim-dap-virtual-text'
		use 'mfussenegger/nvim-dap-python'

		-- tree sitter
		use "nvim-treesitter/nvim-treesitter"

		-- autopairs
		use 'windwp/nvim-autopairs'

		-- Icons
		use "kyazdani42/nvim-web-devicons"

		-- easy commenting
		use "terrortylor/nvim-comment"

		-- nice line
		use 'nvim-lualine/lualine.nvim'

		-- git signs
		use 'lewis6991/gitsigns.nvim'

		-- nice start page
		use 'glepnir/dashboard-nvim'
		use 'kevinhwang91/nvim-bqf'

		-- colors are mine
		use 'norcalli/nvim-colorizer.lua'

		-- theme
		-- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
		use 'Mofiqul/dracula.nvim'

		-- buffer line
		use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

		-- terminal toggle
		use {"akinsho/toggleterm.nvim"}

		-- rainbow parantheses
		use "p00f/nvim-ts-rainbow"

		-- transparency
		use "xiyaowong/nvim-transparent"

		-- automatically create directory on save
		use 'jghauser/mkdir.nvim'

		-- spellchecker
		use 'lewis6991/spellsitter.nvim'

		-- better search
		use {'kevinhwang91/nvim-hlslens'}
end)
