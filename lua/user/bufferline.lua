require("bufferline").setup({
  options = {
    custom_filter = function(buf_number, _)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype == "qf" then
        return false
      end

      return true
      -- -- filter out by buffer name
      -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
      --   return true
      -- end
      -- -- filter out based on arbitrary rules
      -- -- e.g. filter out vim wiki buffer from tabline in your work repo
      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      --   return true
      -- end
      -- -- filter out by it's index number in list (don't show first buffer)
      -- if buf_numbers[1] ~= buf_number then
      --   return true
      -- end
    end,
  },
})

vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>")

vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Others" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Right" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle Pin" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "Pick" })
