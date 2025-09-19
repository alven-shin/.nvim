vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }

-- autocomplete keybinds
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- auto-format
local autoformat = vim.api.nvim_create_augroup("autoformat", {})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = autoformat,
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- enable lsp servers and auto complete
local function on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr)
end

local lsp_configs = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/user/lsp-configs", "*.lua", true, true)
for _, path in ipairs(lsp_configs) do
  local name = vim.fn.fnamemodify(path, ":t:r")

  local config = require("user.lsp-configs." .. name)
  config.on_attach = on_attach -- enable auto complete

  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end
