-- general keymaps
--
-- lsp-specific keybinds are configured in lsp.lua

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- disable cmdline-window keymaps
vim.keymap.set("", "q:", "<nop>")
vim.keymap.set("", "q?", "<nop>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- keep cursor fixed when joining
vim.keymap.set("n", "J", "mzJ`z")

-- jump and searching stay centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste after from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste before from system clipboard" })

-- save without format
local function save_without_format()
  local original = vim.b.autoformat
  vim.b.autoformat = false
  vim.cmd("write")
  vim.b.autoformat = original
end
vim.api.nvim_create_user_command("W", save_without_format, {})
vim.keymap.set("n", "<leader>W", save_without_format, { desc = "Write without format" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Write" })

-- make redo similar to undo
vim.keymap.set("n", "U", "<c-r>", { desc = "Redo" })

-- comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comments", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comments", remap = true })

-- netrw
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Netrw" })

-- diagnostic
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })
