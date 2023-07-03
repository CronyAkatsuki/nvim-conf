return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        -- stylua: ignore
        keys = {
            {
                "<tab>",
                function()
                    return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
            { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require('cmp')
            local defaults = require('cmp.config.default')
            local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

            local cmp_config = {
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
                mapping = {
                    -- if completion menu is visible, go to the next item
                    -- else, trigger completion menu
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        else
                            cmp.complete()
                        end
                    end),

                    -- if completion menu is visible, go to the previous item
                    -- else, trigger completion menu
                    ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            cmp.complete()
                        end
                    end),

                    -- scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-5),
                    ['<C-d>'] = cmp.mapping.scroll_docs(5),

                    -- complete
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- cancel completion
                    ['<C-e>'] = cmp.mapping.abort(),

                    -- confirm selection
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    -- navigate items on the list
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
                },
                formatting = {
                    fields = { 'abbr', 'menu', 'kind' },
                    format = function(entry, item)
                        local short_name = {
                            nvim_lsp = 'LSP',
                            nvim_lua = 'nvim'
                        }

                        local menu_name = short_name[entry.source.name] or entry.source.name

                        item.menu = string.format('[%s]', menu_name)
                        return item
                    end,
                },
            }

            cmp.setup(cmp_config)
        end
    },
}

