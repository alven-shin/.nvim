vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({ update_in_insert = false })

require("rcd").setup()
local au_rcd = vim.api.nvim_create_augroup("rcd", {})

-- show when cursor is idle
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = au_rcd,
    callback = require("rcd").show,
})

-- hide on insert
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    group = au_rcd,
    callback = require("rcd").hide,
})

-- prevent flashing when switching buffers
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = au_rcd,
    callback = require("rcd").hide,
})

-- hide on visual mode to avoid diagonistics covering cursor
vim.api.nvim_create_autocmd("ModeChanged", {
    group = au_rcd,
    pattern = { "*:[vV\x16]*" },
    callback = require("rcd").hide,
})
