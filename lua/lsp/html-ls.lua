-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    cmd = {"/usr/bin/vscode-html-languageserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    capabilities = capabilities
}
