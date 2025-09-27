require("oil").setup({
  keymaps = {
    ["q"] = { "actions.close", mode = "n", nowait = true },
    ["<bs>"] = { "actions.parent", mode = "n" },
    ["<s-h>"] = { "actions.toggle_hidden", mode = "n" },
  },
})
