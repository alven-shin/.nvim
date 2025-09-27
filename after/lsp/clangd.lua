---@brief
---
--- https://clangd.llvm.org/installation.html
---
--- - **NOTE:** Clang >= 11 is recommended! See [#23](https://github.com/neovim/nvim-lspconfig/issues/23).
--- - If `compile_commands.json` lives in a build directory, you should
---   symlink it to the root of your source tree.
---   ```
---   ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
---   ```
--- - clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
---   specified as compile_commands.json, see https://clangd.llvm.org/installation#compile_commandsjson

---@class ClangdInitializeResult: lsp.InitializeResult
---@field offsetEncoding? string

---@type vim.lsp.Config
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
  ---@param init_result ClangdInitializeResult
  on_init = function(client, init_result)
    if init_result.offsetEncoding then
      client.offset_encoding = init_result.offsetEncoding
    end
  end,
}
