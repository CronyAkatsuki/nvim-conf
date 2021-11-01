local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    cmd = {"vscode-html-language-server.cmd", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    capabilities = capabilities
}
