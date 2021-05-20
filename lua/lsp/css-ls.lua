-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
    cmd = { "css-languageserver", "--stdio" },
    on_attach = require'lsp'.common_on_attach
}
