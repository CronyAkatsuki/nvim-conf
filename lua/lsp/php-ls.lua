require'lspconfig'.intelephense.setup {
    cmd = { "intelephense.cmd", "--stdio" },
    on_attach = require'lsp'.common_on_attach
}
