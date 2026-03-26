return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",        -- still useful
      { "folke/lazydev.nvim", ft = "lua", opts = {} },  -- ← This fixes "Undefined global 'vim'"
    },
    config = function()
      -- Mason setup
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "eslint",
          "tailwindcss",
          "cssls",
          "html",
          "rust_analyzer",
          "bashls",
          "pyright",
        },
        automatic_installation = true,
      })

      -- Global diagnostic settings
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Get capabilities from blink.cmp
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configure lua_ls with lazydev support (best way)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim" },  -- safety net
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Attach capabilities to all other servers
      for _, server in ipairs({
        "ts_ls",
        "eslint",
        "tailwindcss",
        "cssls",
        "html",
        "rust_analyzer",
        "bashls",
        "pyright",
      }) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- Enable all servers (this is the modern Neovim way)
      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "eslint",
        "tailwindcss",
        "cssls",
        "html",
        "rust_analyzer",
        "bashls",
        "pyright",
      })
    end,
  },
}