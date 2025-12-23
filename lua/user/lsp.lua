vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- mason and fidget
require("mason").setup()
require("fidget").setup({})

-- load all lsp configs from /lua/user/lsp-configs
-- local lsp_configs = vim.fn.globpath(vim.fn.stdpath("config") .. "/after/lsp", "*.lua", true, true)
-- for _, path in ipairs(lsp_configs) do
--   local name = vim.fn.fnamemodify(path, ":t:r")
--   vim.lsp.enable(name)
-- end

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("taplo")
vim.lsp.enable("tinymist")
vim.lsp.enable("jdtls")
vim.lsp.enable("omnisharp")
vim.lsp.enable("dockerls")
vim.lsp.enable("wgsl_analyzer")

-- go
vim.lsp.enable("gopls")
vim.lsp.enable("golangci_lint_ls")

-- python
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

-- web
vim.lsp.enable("htmls")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("vtsls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("eslint")
vim.lsp.enable("cssls")

-- diagnostic popup
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- enable lsp servers and auto complete
-- this is mapped outside of the autocommand because <c-space> does something weird in insert mode
vim.keymap.set("i", "<c-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- autocomplete mappings
vim.keymap.set("i", "<tab>", function()
  return vim.fn.pumvisible() == 1 and "<c-n>" or "<tab>"
end, { desc = "Select next menu item", expr = true })
vim.keymap.set("i", "<s-tab>", function()
  return vim.fn.pumvisible() == 1 and "<c-p>" or "<s-tab>"
end, { desc = "Select previous menu item", expr = true })
-- vim.keymap.set("i", "<esc>", function()
--   return vim.fn.pumvisible() == 1 and "<esc>a" or "<esc>"
-- end, { desc = "Hide menu", expr = true })
vim.keymap.set("i", "<cr>", function()
  return vim.fn.pumvisible() == 1 and "<c-y>" or "<cr>"
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

-- create single gr keymap
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references", nowait = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client_id = args.data.client_id
    local bufnr = args.buf

    -- enable completion
    vim.lsp.completion.enable(true, client_id, bufnr)
  end,
})

-- Restart LSP for current buffer only
vim.api.nvim_create_user_command("LspRestart", function()
  local buf = vim.api.nvim_get_current_buf()

  -- Get clients attached to current buffer
  local clients = vim.lsp.get_clients({ bufnr = buf })

  -- Stop each client
  for _, client in ipairs(clients) do
    client:stop()
  end

  -- Reload buffer to trigger LSP reattach
  vim.cmd("edit")
end, {})

-- LSP status
vim.api.nvim_create_user_command("LspStatus", function()
  vim.cmd("checkhealth vim.lsp")
end, {})
