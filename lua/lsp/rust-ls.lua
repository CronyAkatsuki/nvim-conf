require'lspconfig'.rust_analyzer.setup{
    cmd = {"/usr/bin/rust-analyzer"},
    on_attach = require'lsp'.common_on_attach
}
