local treesitter = require("nvim-treesitter")

treesitter.setup({
  indent = { enable = true },
  highlight = { enable = true },
  folds = { enable = true },
})

treesitter.install({
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
})
