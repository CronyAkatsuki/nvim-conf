-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
    cmd = { "vscode-css-language-server.cmd", "--stdio" },
    on_attach = require'lsp'.common_on_attach
}
