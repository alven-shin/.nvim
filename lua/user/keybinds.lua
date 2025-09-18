-- general keybinds
--
-- lsp-specific keybinds are configured in lsp.lua

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- disable cmdline-window keymaps
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "q?", "<nop>")

require("which-key").setup({
  preset = "helix",
  icons = {
    mappings = false,
  },
})
