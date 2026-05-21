return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      { "folke/lazydev.nvim", ft = "lua", opts = {} }, -- Fixes "Undefined global 'vim'" for configuration files
    },
    config = function()
      -- Initialize Mason base package downloader
      require("mason").setup()

      -- Global diagnostic styling rules
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Gather complete engine capabilities from blink.cmp to feed into language servers
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configure custom settings for lua_ls
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Define your core language servers stack
      local servers = {
        "ts_ls",
        "eslint",
        "tailwindcss",
        "cssls",
        "html",
        "rust_analyzer",
        "bashls",
        "pyright",
      }

      -- Pre-load default capabilities to all other target servers
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- FIX: We removed "prettierd" from this list. mason-lspconfig now ONLY
      -- receives actual language servers, which fixes the warning.
      require("mason-lspconfig").setup({
        ensure_installed = vim.list_extend({ "lua_ls" }, servers),
        automatic_installation = true,
        handlers = {
          function(server_name)
            -- Hand over server activation completely to native Neovim core engine
            vim.lsp.enable(server_name)
          end,
        },
      })
    end,
  },
}
