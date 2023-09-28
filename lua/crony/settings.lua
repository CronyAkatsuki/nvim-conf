local opt = vim.opt

opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 2
opt.list = true
opt.mouse = "a"
opt.pumblend = 10
opt.pumheight = 10
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shortmess:append({ W = true, I = true, c = true })

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.wildmode = "longest:full,full"
opt.winminwidth = 5

opt.updatetime = 50
opt.timeoutlen = 300

opt.colorcolumn = "80"

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
