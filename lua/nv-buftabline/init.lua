local options = {
    modifier = ":t",
    index_format = "(%d) ",
    padding = 1,
    icons = true,
    start_hidden = false,
    auto_hide = false,
    disable_commands = false,
    go_to_maps = true,
    kill_maps = true,
    custom_command = nil,
    custom_map_prefix = nil,
    hlgroup_current = "TabLineSel",
    hlgroup_normal = "TabLineFill",
}

require("buftabline").setup(options)

vim.api.nvim_set_keymap('n', '<TAB>', ':BufNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufPrev<CR>', { noremap = true, silent = true })
