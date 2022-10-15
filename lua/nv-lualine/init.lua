local lualine = require('lualine')

local colors =  require("catppuccin.palettes").get_palette()

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        component_separators = "",
        section_separators = "",
        theme = {
            normal = { c = { fg = colors.foreground, bg = colors.crust } },
            inactive = { c = { fg = colors.foreground, bg = colors.crust } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = function()
        local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.pink,
            [""] = colors.mauve,
            V = colors.flamingo,
            c = colors.blue,
            no = colors.peach,
            s = colors.pink,
            S = colors.pink,
            [""] = colors.pink,
            ic = colors.teal,
            R = colors.subtext0,
            Rv = colors.subtext0,
            cv = colors.peach,
            ce = colors.peach,
            r = colors.base,
            rm = colors.base,
            ["r?"] = colors.base,
            ["!"] = colors.peach,
            t = colors.peach,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
})

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.sapphire, gui = "bold" },
})

ins_left({
    "branch",
    icon = "",
    color = { fg = colors.subtext1, gui = "bold" },
})

ins_left({
    "diff",
    symbols = { added = " ", modified = "柳 ", removed = " " },
    diff_color = {
        added = { fg = colors.teal },
        modified = { fg = colors.rosewater },
        removed = { fg = colors.yellow },
    },
    cond = conditions.hide_in_width,
})

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.yellow },
        color_warn = { fg = colors.sky },
        color_info = { fg = colors.rosewater },
    },
})

ins_left({
    function()
        return "%="
    end,
})

ins_left({
    -- Lsp server name .
    function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = "  LSP:",
    color = { fg = colors.overlay2},
})

-- Add components to right sections
ins_right({
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.subtext0, gui = "bold" },
})

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = true,
    color = { fg = colors.color1 },
})

ins_right({"location"})

ins_right({"progress", color = { fg = colors.subtext0, gui = "bold" } })

lualine.setup(config)
