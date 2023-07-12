return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "python" })
            end
        end,
    },
    {
        -- Ensure C/C++ debugger and lsp are installed
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "pyright", "mypy", "ruff", "black", "debugpy" })
            end
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python" },
        opts = function(_, opts)
            local nls = require("null-ls")
            if type(opts.sources) == "table" then
                vim.list_extend(
                    opts.sources,
                    { nls.builtins.diagnostics.mypy, nls.builtins.diagnostics.ruff, nls.builtins.formatting.black }
                )
            end
        end,
    },
    -- {
    --     "mfussenegger/nvim-dap-python",
    --     ft = "python",
    --     config = function()
    --         require("dap-python").setup('~/.local/share/nvim')
    --     end,
    --     keys = {
    --         {
    --             "<leader>dpr",
    --             function()
    --                 require("dap-python").test_method()
    --             end,
    --             desc = "Start python debuging",
    --         },
    --     },
    -- },
}
