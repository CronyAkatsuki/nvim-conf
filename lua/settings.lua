local set = vim.opt

vim.notify = require("notify")

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.scrolloff = 5
set.fileencoding = "utf-8"

set.relativenumber = true
set.cursorline = true

set.termguicolors = true
set.syntax = "on"

set.hidden = true
set.completeopt = "menuone,noselect"

set.title = true
set.titlestring = "%<%F%=%l/%L - nvim"

set.mouse = "a"
set.clipboard = "unnamedplus"
set.guifont = {"FiraCode Nerd Font", "h12"}
