local null_ls = require "null-ls"
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

  -- webdev stuff
  format.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "astro",
      "svelte",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    extra_filetypes = { "svelte" },
  }, -- so prettier works only on these filetypes

  -- Lua
  format.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
