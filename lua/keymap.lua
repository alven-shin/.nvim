-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- disable cmdline-window keymaps
vim.keymap.set('n', 'q:', '<nop>')
vim.keymap.set('n', 'q?', '<nop>')
