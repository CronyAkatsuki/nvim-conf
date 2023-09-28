return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    cmd = "Telescope",
    ft = "Mason",
    keys = {
        { '<leader>pf', function() require 'telescope.builtin'.find_files() end,  desc = "Find all files in directory" },
        { '<leader>pg', function() require 'telescope.builtin'.git_files() end,   desc = "Find git files in directory" },
        { '<leader>pw', function() require 'telescope.builtin'.live_grep() end,   desc = "Grep for word live" },
    }
}
