--> Create Parrent if not existing
vim.api.nvim_create_autocmd( "BufWritePre" , {
  pattern = "*",
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(ctx)
    local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
    vim.fn.mkdir(dir, "p")
  end
})

---Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  end,
})

-- center screen automatically when entering insert mode
vim.api.nvim_create_autocmd( "InsertEnter", {
  pattern = '*',
  callback = function ()
    vim.api.nvim_feedkeys("zz", "xn", true)
  end,
})

-- Open file at the last edited line
vim.api.nvim_create_autocmd( "BufWinEnter" , {
  callback = function ()
    local cursor_position = vim.api.nvim_buf_get_mark(0, '"')
    local row = cursor_position[1]
    if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
      if vim.api.nvim_buf_line_count(0) == vim.fn.line("w$") then
        vim.api.nvim_win_set_cursor(0, cursor_position)
      elseif vim.api.nvim_buf_line_count(0) - row > ((vim.fn.line("w$") - vim.fn.line("w0")) / 2) - 1 then
        vim.api.nvim_win_set_cursor(0, cursor_position)
        vim.api.nvim_input("zz")
      else
        vim.api.nvim_win_set_cursor(0, cursor_position)
        vim.api.nvim_input("<c-e>")
      end
      if vim.api.nvim_eval("foldclosed('.')") ~= -1 then
        vim.api.nvim_input("zvzz")
      end
    end
  end
})
