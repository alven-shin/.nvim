vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- mason
require("mason").setup()

-- enable lsp servers and auto complete
local function on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr)

  -- autocomplete mappings
  vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion", buffer = bufnr })
  vim.keymap.set("i", "<tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<tab>"
  end, { desc = "Select next menu item", buffer = bufnr, expr = true })
  vim.keymap.set("i", "<s-tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<s-tab>"
  end, { desc = "Select previous menu item", buffer = bufnr, expr = true })
  vim.keymap.set("i", "<esc>", function()
    return vim.fn.pumvisible() == 1 and "<esc>a" or "<esc>"
  end, { desc = "Hide menu", buffer = bufnr, expr = true })
  vim.keymap.set("i", "<cr>", function()
    return vim.fn.pumvisible() == 1 and "<esc>a" or "<cr>"
  end, { desc = "Confirm current entry", buffer = bufnr, expr = true })

  -- common lsp commands
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code actions", buffer = bufnr })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = bufnr })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })

  -- unmap existing gr keymaps
  pcall(function()
    vim.keymap.del("n", "gra", { buffer = bufnr })
  end)
  pcall(function()
    vim.keymap.del("n", "gri", { buffer = bufnr })
  end)
  pcall(function()
    vim.keymap.del("n", "grn", { buffer = bufnr })
  end)
  pcall(function()
    vim.keymap.del("n", "grr", { buffer = bufnr })
  end)

  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references", buffer = bufnr, nowait = true })
end

-- load all lsp configs from /lua/user/lsp-configs
local lsp_configs = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/user/lsp-configs", "*.lua", true, true)
for _, path in ipairs(lsp_configs) do
  local name = vim.fn.fnamemodify(path, ":t:r")

  local config = require("user.lsp-configs." .. name)
  config.on_attach = on_attach -- enable auto complete

  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- conform
require("conform").setup({
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },
    swift = { "swiftformat" },
    python = { "ruff_format", "ruff_organize_imports" },
    java = { "clang-format" },

    -- webdev
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    svelte = { "prettierd" },
    vue = { "prettierd" },
  },
})
