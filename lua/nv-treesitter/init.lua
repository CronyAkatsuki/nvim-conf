require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ignore_install = O.treesitter.ignore_install,
    highlight = {
        enable = true -- false will disable the whole extension
    },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    indent = {enable = true},
    autotag = {enable = true},
}
