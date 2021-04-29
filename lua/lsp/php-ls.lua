require'lspconfig'.intelephense.setup {
    cmd = { "/usr/bin/intelephense", "--stdio" },
    on_attach = require'lsp'.common_on_attach
}
