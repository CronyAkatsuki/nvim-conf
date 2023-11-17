return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- load the helper value
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    -- setup the colors
    local colors = {
      bright_bg = utils.get_highlight("ColorColumn").bg,
      bright_fg = utils.get_highlight("ColorColumn").fg,
      red = utils.get_highlight("DiagnosticError").fg,
      dark_red = utils.get_highlight("DiffDelete").bg,
      green = utils.get_highlight("String").fg,
      blue = utils.get_highlight("Function").fg,
      gray = utils.get_highlight("NonText").fg,
      orange = utils.get_highlight("Constant").fg,
      purple = utils.get_highlight("Statement").fg,
      cyan = utils.get_highlight("Special").fg,
      diag_warn = utils.get_highlight("DiagnosticWarn").fg,
      diag_error = utils.get_highlight("DiagnosticError").fg,
      diag_hint = utils.get_highlight("DiagnosticHint").fg,
      diag_info = utils.get_highlight("DiagnosticInfo").fg,
      git_del = utils.get_highlight("diffRemoved").fg,
      git_add = utils.get_highlight("diffAdded").fg,
      git_change = utils.get_highlight("diffChanged").fg,
    }

    -- load the colors
    require("heirline").load_colors(colors)

    -- vi mode indicator
    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      static = {
        mode_names = {
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "red",
          i = "green",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      provider = function(self)
        return " " .. self.mode_names[self.mode] .. " "
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return {
          bg = self.mode_colors[mode],
          fg = "bright_bg",
          bold = true,
        }
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
    }

    -- File name block
    local FileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }

    -- File icon
    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. " ")
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    -- file name text
    local FileName = {
      init = function(self)
        self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
        if self.lfilename == "" then
          self.lfilename = "[No Name]"
        end
      end,
      hl = { fg = utils.get_highlight("Directory").fg },

      flexible = 2,

      {
        provider = function(self)
          return self.lfilename
        end,
      },
      {
        provider = function(self)
          return vim.fn.pathshorten(self.lfilename)
        end,
      },
    }

    -- Add some nice flags
    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " [+]",
        hl = { fg = "green" },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "orange" },
      },
    }

    -- Change file name to green if file changed
    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = "green", bold = true, force = true }
        end
      end,
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(
      FileNameBlock,
      FileIcon,
      utils.insert(FileNameModifer, FileName),
      FileFlags,
      { provider = "%<" }
    )

    local FileType = {
      provider = function()
        return string.upper(vim.bo.filetype)
      end,
      hl = { fg = utils.get_highlight("Type").fg, bold = true },
    }

    -- Where am I?
    local Ruler = {
      provider = "%l/%L:%c %P",
    }

    -- I take no credits for this! :lion:
    local ScrollBar = {
      static = {
        sbar = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " },
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
      end,
      hl = { fg = "bright_bg", bg = "blue" },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
          table.insert(names, server.name)
        end
        return " [" .. table.concat(names, " ") .. "]"
      end,
      hl = { fg = "green", bold = true },
    }

    local Diagnostics = {

      condition = conditions.has_diagnostics,

      static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
      },

      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { "DiagnosticChanged", "BufEnter" },

      {
        provider = "",
      },
      {
        provider = function(self)
          -- 0 is just another output, we can decide to print it or not!
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = "diag_error" },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = "diag_warn" },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = "diag_info" },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "diag_hint" },
      },
      {
        provider = "",
      },
    }

    local Git = {
      condition = conditions.is_git_repo,

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
      end,

      hl = { fg = "orange" },

      { -- git branch name
        provider = function(self)
          return " " .. self.status_dict.head
        end,
        hl = { bold = true },
      },
      -- You could handle delimiters, icons and counts similar to Diagnostics
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = " ",
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("+" .. count)
        end,
        hl = { fg = "git_add" },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("-" .. count)
        end,
        hl = { fg = "git_del" },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("~" .. count)
        end,
        hl = { fg = "git_change" },
      },
    }

    local HelpFileName = {
      condition = function()
        return vim.bo.filetype == "help"
      end,
      provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
      end,
      hl = { fg = colors.blue },
    }

    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- stylua: ignore
    local DefaultStatusline = {
      ViMode, Space, FileNameBlock, Space, Git, Space, Diagnostics, Align,
      LSPActive, Align,
      FileType, Space, Ruler, Space, ScrollBar
    }

    -- stylua: ignore
    local InactiveStatusline = {
      condition = conditions.is_not_active,
      FileType,
      Space,
      FileName,
      Align,
    }

    -- stylua: ignore
    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
        })
      end,

      FileType,
      Space,
      HelpFileName,
      Align
    }

    local TerminalStatusline = {

      condition = function()
        return conditions.buffer_matches({ buftype = { "terminal" } })
      end,

      hl = { bg = "dark_red" },

      -- Quickly add a condition to the ViMode to only show it when buffer is active!
      { condition = conditions.is_active, ViMode, Space },
      FileType,
      Align,
    }


    -- stylua: ignore
    local StatusLines = {

      hl = function()
        if conditions.is_active() then
          return "StatusLine"
        else
          return "StatusLineNC"
        end
      end,

      fallthrough = false,

      SpecialStatusline,
      TerminalStatusline,
      InactiveStatusline,
      DefaultStatusline,
    }

    -- buffer number
    local TablineBufnr = {
      provider = function(self)
        return tostring(self.bufnr) .. ". "
      end,
      hl = "Comment",
    }

    -- we redefine the filename component, as we probably only want the tail and not the relative path
    local TablineFileName = {
      provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
      end,
      hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
      end,
    }

    -- this looks exactly like the FileFlags component that we saw in
    -- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
    -- also, we are adding a nice icon for terminal buffers.
    local TablineFileFlags = {
      {
        condition = function(self)
          return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "[+]",
        hl = { fg = "green" },
      },
      {
        condition = function(self)
          return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
              or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
          if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
            return "  "
          else
            return ""
          end
        end,
        hl = { fg = "orange" },
      },
    }

    -- Here the filename block finally comes together
    local TablineFileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
      end,
      hl = function(self)
        if self.is_active then
          return "bright_bg"
        else
          return "background"
        end
      end,
      TablineBufnr,
      FileIcon,
      TablineFileName,
      TablineFileFlags,
    }

    -- The final touch!
    local TablineBufferBlock = utils.surround({ "█", "█" }, function(self)
      if self.is_active then
        return "bright_bg"
      else
        return "background"
      end
    end, { TablineFileNameBlock })

    -- and here we go
    local BufferLine = utils.make_buflist(
      TablineBufferBlock,
      { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
      { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    )

    local TabLine = { BufferLine }

    require("heirline").setup({ statusline = StatusLines, tabline = TabLine })

    vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
  end,
}
