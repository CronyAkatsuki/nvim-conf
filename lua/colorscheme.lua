--> local pywal = require('pywal')

--> pywal.setup()

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    integrations = {
        barbar = true,
        dashboard = true,
        gitsigns = true,
        cmp = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        }
    }
})

vim.cmd [[colorscheme catppuccin]]
