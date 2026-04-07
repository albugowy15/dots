return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  version = "*",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      astro = { "eslint" },
      dockerfile = { "hadolint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      svelte = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
