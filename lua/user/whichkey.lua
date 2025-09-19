require("which-key").setup({
  preset = "helix",
  icons = {
    mappings = false,
  },
  spec = {
    { "<leader>g", group = "GitSigns" },
    { "<leader>gh", group = "Hunks" },
  },
})
