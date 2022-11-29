local set = vim.opt

set.backup = false
set.cmdheight = 2
set.conceallevel = 2
set.pumheight = 10
set.swapfile = false
set.undofile = true
set.writebackup = false

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.linebreak = true
set.scrolloff = 8
set.fileencoding = "utf-8"

set.number = true
set.relativenumber = true
set.numberwidth = 2
set.signcolumn = "yes"
set.cursorline = true

set.termguicolors = true
set.syntax = "on"

set.hidden = true
set.completeopt = { "menuone", "noselect" }

set.title = true
set.titlestring = "%<%F%=%l/%L - nvim"

set.mouse = "a"
set.clipboard = "unnamedplus"

set.updatetime = 250
set.timeoutlen = 250

set.shortmess:append "c"

set.guifont = { "BlexMono Nerd Font", ":h12" }
