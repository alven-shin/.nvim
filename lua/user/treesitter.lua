local treesitter = require("nvim-treesitter.configs")

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
  auto_install = vim.fn.executable("tree-sitter") == 1,
  indent = { enable = true },
  highlight = { enable = true },
  folds = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>", -- set to `false` to disable one of the mappings
      node_incremental = "<c-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
})
