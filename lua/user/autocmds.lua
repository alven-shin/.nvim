-- disable cmdline
vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.cmd("quit")
  end,
})

-- q to quit quickfix
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>quit<CR>", { buffer = true })
  end,
})

-- save folds and cursor position
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.filetype ~= "gitcommit" and vim.bo.buftype == "" then
      vim.cmd("mkview")
    end
  end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "" and vim.bo.filetype ~= "gitcommit" and vim.bo.buftype == "" then
      vim.cmd("silent! loadview")
    end
  end,
})
