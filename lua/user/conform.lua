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
