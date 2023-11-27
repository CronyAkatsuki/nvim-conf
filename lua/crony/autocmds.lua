local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("crony_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, buf, mark)
    end
  end,
})

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

autocmd({ "User", "BufWinEnter" }, {
  desc = "Disable status, tablines, and cmdheight for alpha",
  group = augroup("alpha_settings"),
  callback = function(args)
    if
        (
          (args.event == "User" and args.file == "AlphaReady")
          or (
            args.event == "BufWinEnter"
            and vim.api.nvim_get_option_value("filetype", { buf = args.buf }) == "alpha"
          )
        ) and not vim.g.before_alpha
    then
      vim.g.before_alpha = {
        showtabline = vim.opt.showtabline:get(),
        laststatus = vim.opt.laststatus:get(),
        cmdheight = vim.opt.cmdheight:get(),
      }
      vim.opt.showtabline, vim.opt.laststatus, vim.opt.cmdheight = 0, 0, 0
    elseif
        vim.g.before_alpha
        and args.event == "BufWinEnter"
        and vim.api.nvim_get_option_value("buftype", { buf = args.buf }) ~= "nofile"
    then
      vim.opt.laststatus, vim.opt.showtabline, vim.opt.cmdheight =
          vim.g.before_alpha.laststatus, vim.g.before_alpha.showtabline, vim.g.before_alpha.cmdheight
      vim.g.before_alpha = nil
    end
  end,
})
autocmd("VimEnter", {
  desc = "Start Alpha when vim is opened with no arguments",
  group = augroup("alpha_autostart"),
  callback = function()
    local should_skip
    local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
    if
        vim.fn.argc() > 0                  -- don't start when opening a file
        or #lines > 1                      -- don't open if current buffer has more than 1 line
        or (#lines == 1 and lines[1]:len() > 0) -- don't open the current buffer if it has anything on the first line
        or #vim.tbl_filter(function(bufnr)
          return vim.bo[bufnr].buflisted
        end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
        or not vim.o.modifiable       -- don't open if not modifiable
    then
      should_skip = true
    else
      for _, arg in pairs(vim.v.argv) do
        if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
          should_skip = true
          break
        end
      end
    end
    if should_skip then
      return
    end
    require("alpha").start(true, require("alpha").default_config)
    vim.schedule(function()
      vim.cmd.doautocmd("FileType")
    end)
  end,
})

-- autocmd("BufEnter", {
--   desc = "Open Neo-Tree on startup with directory",
--   group = augroup("neotree_start"),
--   callback = function()
--     if package.loaded["neo-tree"] then
--       vim.api.nvim_del_augroup_by_name "crony_neotree_start"
--     else
--       local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0))   -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
--       if stats and stats.type == "directory" then
--         vim.api.nvim_del_augroup_by_name "crony_neotree_start"
--         require "neo-tree"
--       end
--     end
--   end,
-- })
