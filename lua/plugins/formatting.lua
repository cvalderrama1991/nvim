return {
  {

    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        fortmatters = {
          -- 1. Base definition for Prettier (Default settings)
          -- This will be used for JSON, HTML, etc., keeping double quotes.
          prettier = {},

          -- 2. Custom definition for JS/TS files
          prettier_js = {
            -- This tells conform to run the 'prettier' executable
            inherit = "prettier",

            -- This adds the single-quote flag ONLY when 'prettier_js' is called
            prepend_args = { "--single-quote" },
          },
        },
        formatters_by_ft = {
          javascript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          python = { "isort", "black" },
          zsh = { "shfmt" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          markdown = { "prettierd", "prettier", stop_after_first = true }
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
