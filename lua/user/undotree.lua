vim.g.undotree_WindowLayout = 3
vim.g.undotree_DiffAutoOpen = 0
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })
