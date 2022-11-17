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
	use "wbthomason/packer.nvim"  --> update itself

  use "lewis6991/impatient.nvim"  --> Make nvim faster
	use "fladson/vim-kitty"  --> kitty terminal syntax highlighting

  -- use { "nvim-tree/nvim-tree.lua",
  --   requires = "nvim-tree/nvim-web-devicons",
  --   config = function ()
  --     require("plugins.nvim-tree")
  --   end
  -- }

  use { "catppuccin/nvim",
    as = "catppuccin" } --> theme

  use {'akinsho/bufferline.nvim',
    event = "BufReadPre",
    after = "catppuccin",
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("plugins.bufferline")
    end
  }

  -- use { "nvim-lualine/lualine.nvim",
  --   after = "catppuccin",
  --   config = function ()
  --     require("plugins.lualine")
  --   end
  -- } --> status line

  --> using BufRead makes them not run until going into input mode or cmdline
  use { "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function ()
      require("plugins.colorizer")
    end
  }
	use {"williamboman/mason.nvim",
    event = "BufReadPre"
  } --> installer for the lsp's
  use {"williamboman/mason-lspconfig.nvim",
    after = 'mason.nvim',
    config = function ()
      require("plugins.mason")
    end
  }
	use {"neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim",
    config = function ()
      require("lsp")
      require("user.diagnostics")
    end
  } --> lsp config
  use { 'j-hui/fidget.nvim',
    after = "nvim-lspconfig",
    config = function ()
      require('fidget').setup()
    end
  }

	use { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "BufRead",
    config = function ()
      require("plugins.nvim-treesitter")
    end
  } --> Treesitter support

	use {"lukas-reineke/indent-blankline.nvim",
    after = 'nvim-treesitter',
    config = function ()
      require("plugins.indent_blankline")
    end
  } --> indent line

  use {'dcampos/nvim-snippy', event = {'InsertEnter', 'CmdlineEnter'}} --> snipperts
	use {"onsails/lspkind-nvim", after = 'nvim-snippy'} --> kind icons for completion
	use {"hrsh7th/nvim-cmp",
    after = 'lspkind-nvim',
    config = function ()
      require("plugins.nvim-cmp")
    end
  } --> Autocompletion plugin
	use {"hrsh7th/cmp-nvim-lsp", after = 'nvim-cmp'} --> LSP source for nvim-cmp
	use {"hrsh7th/cmp-buffer", after = 'cmp-nvim-lsp'} --> Buffer source for nvim-cmp
	use {"hrsh7th/cmp-path", after = 'cmp-buffer' } --> Path source for nvim-cmp
	use {"hrsh7th/cmp-cmdline", after = 'cmp-path'} --> cmdline source for nvim-cmp
  use {"dcampos/cmp-snippy", after = 'cmp-cmdline'} --> cmp snippy support
	use {"ray-x/cmp-treesitter", after = 'cmp-snippy'} --> treesitter autocompletion support

	use {"windwp/nvim-autopairs",
    event = 'InsertCharPre',
    after = 'nvim-cmp',
    config = function ()
      require("plugins.nvim-autopairs")
    end
  } --> great autopair support

	use {"terrortylor/nvim-comment",
    keys = {'<leader>cl', '<leader>c'},
    config = function ()
      require('plugins.nvim-comment')
    end
  } --> better commenting

	use {"lewis6991/gitsigns.nvim",
  event = "BufRead",
  ft = "gitcommit",
  config = function ()
    require('plugins.gitsigns')
  end} --> git sings to show you what you changed you sneaky little bastard

  use {"vimwiki/vimwiki", ft = "markdown"} --> lets make a wiki

	use {"nvim-telescope/telescope-ui-select.nvim", cmd = "Telescope"} --> telescope picker
  use { "nvim-telescope/telescope.nvim",
    after = "telescope-ui-select.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function ()
      require("plugins.telescope")
    end
  } --> telescope

  use {"numToStr/FTerm.nvim",
    cmd = "FTermToggle",
    config = function ()
      require("plugins.fterm")
    end
  }
end)
