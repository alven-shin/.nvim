-- disable cmdline
vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.cmd("quit")
    -- vim.api.nvim_buf_delete(0, { force = true })
  end,
})
