require("todo-comments").setup({})

vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
