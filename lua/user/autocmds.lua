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
