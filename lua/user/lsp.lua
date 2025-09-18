vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- auto-format
local autoformat = vim.api.nvim_create_augroup("autoformat", {})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = autoformat,
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.lsp.enable("luals")
