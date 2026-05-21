return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 1000, -- Increased from 500 to 1000ms to stop the "Formatter 'prettierd' timeout" warning
      lsp_format = "fallback",
    },
    formatters = {
      -- We override the configurations safely here
      prettierd = {
        env = {
          -- This instructs Prettierd natively without appending risky CLI array strings
          PRETTIERD_DEFAULT_CONFIG = vim.fn.json_encode({
            tabWidth = 2,
            semi = true,
            singleQuote = true,
            jsxSingleQuote = true,
          }),
        },
      },
      prettier = {
        env = {
          PRETTIER_DEFAULT_CONFIG = vim.fn.json_encode({
            tabWidth = 2,
            semi = true,
            singleQuote = true,
            jsxSingleQuote = true,
          }),
        },
      },
    },
  },
}
