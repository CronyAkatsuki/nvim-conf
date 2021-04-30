vim.g.dashboard_custom_header = {

[[                    _         _]],
[[ _ __   ___ _ __ __| | __   _(_)_ __ ___]],
[[| '_ \ / _ \ '__/ _` | \ \ / / | '_ ` _ \]],
[[| | | |  __/ | | (_| |  \ V /| | | | | | |]],
[[|_| |_|\___|_|  \__,_|   \_/ |_|_| |_| |_|]],

} 

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'},
    e = {description = {'  Marks              '}, command = 'Telescope marks'}
}

-- file_browser = {description = {' File Browser'}, command = 'Telescope find_files'},

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',

vim.api.nvim_set_keymap('n', '<Leader>ss', ':<C-u>SessionSave<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sl', ':<C-u>SessionLoad<CR>', { noremap = true, silent = true})

vim.g.dashboard_session_directory = {'~/.cache/nvim/session'}
vim.g.dashboard_custom_footer = {'chronytips.github.io'}
