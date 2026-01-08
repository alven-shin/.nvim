require("user.options")
require("user.colorscheme")
require("user.keymaps")
require("user.autocmds")
require("user.treesitter")
require("user.lsp") -- mason setup is here too
require("user.conform")
require("user.diagnostics")
require("user.telescope")
require("user.gitsigns")
require("user.whichkey")
require("user.bufferline")
require("user.undotree")
require("user.oil")
require("user.snacks")
require("user.todo")
require("user.autopair")
require("user.ai")
require("user.roslyn")

-- NOTE: things to do when adding a new language config:
-- - add lsp config to /after/lsp
-- - add server to /lua/user/lsp.lua
-- - configure conform and lint if needed
-- - configure indents in /after/ftplugin if needed

-- vscode keymaps
if vim.g.vscode then
  local map = vim.keymap.set
  map("n", ">", ">>")
  map("n", "<", "<<")
  map("v", "<", "<gv")
  map("v", ">", ">gv")
  map("n", "J", "mzJ`z")
  map({ "n", "v" }, "<leader>y", [["+y]])
  map({ "n", "v" }, "<leader>d", [["+d]])
  map({ "n", "v" }, "<leader>p", [["+p]])
  map({ "n", "v" }, "<leader>P", [["+P]])
  map("n", "<S-u>", "<C-r>")
  map("n", "<leader>w", [[<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>]])
  map(
    "n",
    "<leader>e",
    [[<Cmd>call VSCodeNotify("workbench.action.focusSideBar")<CR> <Cmd>call VSCodeNotify("workbench.action.focusSideBar")<CR>]]
  )
  map("n", "<leader><leader>", [[<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>]])
  map("n", "gr", [[<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>]])
  map("n", "gl", [[<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>]])
  map("n", "gh", [[<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>]])
  map("n", "<S-k>", [[<Cmd>call VSCodeNotify("editor.action.showHover")<CR>]])
  map("n", "<S-h>", [[<Cmd>call VSCodeNotify("workbench.action.previousEditor")<CR>]])
  map("n", "<S-l>", [[<Cmd>call VSCodeNotify("workbench.action.nextEditor")<CR>]])
  map("n", "<leader>/", [[<Cmd>call VSCodeNotify("editor.action.commentLine")<CR>]])
  map("v", "<leader>/", [[<Plug>VSCodeCommentarygv]])
  map("n", "<leader>la", [[<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>]])
  map("n", "<leader>lr", [[<Cmd>call VSCodeNotify("editor.action.rename")<CR>]])
end
