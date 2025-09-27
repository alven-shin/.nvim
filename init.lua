require("user.options")
require("user.colorscheme")
require("user.keymaps")
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

-- NOTE: things to do when adding a new language config:
-- - add lsp config to /after/lsp
-- - add server to /lua/user/lsp.lua
-- - add language to treesitter ensure_installed
-- - configure conform and lint if needed
-- - configure indents in /after/ftplugin if needed
