return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        ts_ls = {},
        eslint = {},
        tailwindcss = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "eslint", "ts_ls", "cssls", "html" }
      })

      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        virtual_text = true,
        -- virtual_lines = true,
        --underline = true
      })

      vim.lsp.enable("lua_ls")
    end
  }
}
