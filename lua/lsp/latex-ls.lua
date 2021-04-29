require'lspconfig'.texlab.setup{
    cmd = { "/usr/bin/texlab" },
    on_attach = require'lsp'.common_on_attach
}
