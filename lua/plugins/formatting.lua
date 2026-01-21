return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters = {
          prettier_js = {
            inherit = "prettier",
            prepend_args = { "--single-quote", "--semi" },
          },
        },

        formatters_by_ft = {
          javascript = { "prettier_js" },
          javascriptreact = { "prettier_js" },
          typescript = { "prettier_js" },
          typescriptreact = { "prettier_js" },
          -- Standard prettier/prettierd for others
          css = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          python = { "isort", "black" },
          zsh = { "shfmt" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          markdown = { "prettier", "injected" },
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
