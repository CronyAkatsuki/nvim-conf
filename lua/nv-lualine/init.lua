local lualine = require('lualine')

local pywal_core = require('pywal.core')
local colors = pywal_core.get_colors()

-- local colors = {
--     bg = "#1C1F24",
--     fg = "#bbc2cf",
--     yellow = "#ecbe7b",
--     cyan = "#46d9ff",
--     darkblue = "#2257a0",
--     green = "#98be65",
--     orange = "#da8548",
--     violet = "#a9a1e1",
--     magenta = "#c678dd",
--     blue = "#51afef",
--     red = "#ff6c6b",
-- }

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
            normal = { c = { fg = colors.foreground, bg = colors.background } },
            inactive = { c = { fg = colors.foreground, bg = colors.background } },
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
            n = colors.color3,
            i = colors.color2,
            v = colors.color1,
            [""] = colors.color1,
            V = colors.color1,
            c = colors.color4,
            no = colors.color3,
            s = colors.color5,
            S = colors.color5,
            [""] = colors.color5,
            ic = colors.color6,
            R = colors.color7,
            Rv = colors.color7,
            cv = colors.color3,
            ce = colors.color3,
            r = colors.color8,
            rm = colors.color8,
            ["r?"] = colors.color8,
            ["!"] = colors.color3,
            t = colors.color3,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
})

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.color4, gui = "bold" },
})

ins_left({
    "branch",
    icon = "",
    color = { fg = colors.color7, gui = "bold" },
})

ins_left({
    "diff",
    symbols = { added = " ", modified = "柳 ", removed = " " },
    diff_color = {
        added = { fg = colors.color2 },
        modified = { fg = colors.color5 },
        removed = { fg = colors.color3 },
    },
    cond = conditions.hide_in_width,
})

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.color3 },
        color_warn = { fg = colors.color6 },
        color_info = { fg = colors.color8 },
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
    color = { fg = colors.foreground},
})

-- Add components to right sections
ins_right({
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.color1, gui = "bold" },
})

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = true,
    color = { fg = colors.color1 },
})

ins_right({"location"})

ins_right({"progress", color = { fg = colors.foreground, gui = "bold" } })

lualine.setup(config)
