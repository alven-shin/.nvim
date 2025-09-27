require("which-key").setup({
  preset = "helix",
  icons = {
    mappings = false,
  },
  spec = {
    { "<leader>g", group = "GitSigns" },
    { "<leader>gh", group = "Hunks" },
    { "<leader>b", group = "Buffer" },
    { "<leader>f", group = "Find (Telescope)" },
  },
})
