require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "bold" },
    functions = { "italic"},
    keywords = { "italic"},
    strings = { "italic" },
    variables = { "bold" },
    numbers = { "bold" },
    booleans = { "italic" },
    properties = { "italic" },
    types = {},
    operators = { "bold" },
  },
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
    },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    treesitter = true,
    fidget = true,
    -- markdown = true,
    -- vimwiki = true,
    which_key = true,
  },
  indent_blankline = {
    enabled = true,
    colored_indent_levels = true,
  },
})

vim.cmd.colorscheme "catppuccin"
