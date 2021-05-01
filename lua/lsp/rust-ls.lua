local opts = {
    tools = {
        autoSetHints = true,

        hover_with_actions = true,

        runnables = {
            use_telescope = true

        },

        inlay_hints = {
            show_parameter_hints = true,

            parameter_hints_prefix = "<-",

            other_hints_prefix  = "=>",
        },
    },

    server = {},
}

require('rust-tools').setup(opts)
