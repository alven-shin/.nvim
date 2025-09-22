vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- mason
require("mason").setup()

-- load all lsp configs from /lua/user/lsp-configs
-- local lsp_configs = vim.fn.globpath(vim.fn.stdpath("config") .. "/after/lsp", "*.lua", true, true)
-- for _, path in ipairs(lsp_configs) do
--   local name = vim.fn.fnamemodify(path, ":t:r")
--   vim.lsp.enable(name)
-- end
vim.lsp.enable("luals")
vim.lsp.enable("clangd")

-- enable lsp servers and auto complete
-- this is mapped outside of the autocommand because <c-space> does something weird in insert mode
vim.keymap.set("i", "<c-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- autocomplete mappings
vim.keymap.set("i", "<tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<tab>"
end, { desc = "Select next menu item", expr = true })
vim.keymap.set("i", "<s-tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<s-tab>"
end, { desc = "Select previous menu item", expr = true })
-- vim.keymap.set("i", "<esc>", function()
--   return vim.fn.pumvisible() == 1 and "<esc>a" or "<esc>"
-- end, { desc = "Hide menu", expr = true })
vim.keymap.set("i", "<cr>", function()
  return vim.fn.pumvisible() == 1 and "<esc>a" or "<cr>"
end, { desc = "Confirm current entry", expr = true })

-- common lsp commands
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- unmap existing gr keymaps
pcall(function()
  vim.keymap.del("n", "gra")
end)
pcall(function()
  vim.keymap.del("n", "gri")
end)
pcall(function()
  vim.keymap.del("n", "grn")
end)
pcall(function()
  vim.keymap.del("n", "grr")
end)

vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references", nowait = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client_id = args.data.client_id
    local bufnr = args.buf

    vim.lsp.completion.enable(true, client_id, bufnr)
  end,
})
