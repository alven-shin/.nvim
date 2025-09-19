require("bufferline").setup({})

vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>")

vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Others" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Right" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle Pin" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "Pick" })
