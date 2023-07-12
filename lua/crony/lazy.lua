local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "crony.plugins" },
        { import = "crony.plugins.lang.clang" },
        { import = "crony.plugins.lang.python" },
    },
    defaults = { lazy = true },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "fzf",
                "zip",
                "zipPlugin",
            },
        },
    },
})
