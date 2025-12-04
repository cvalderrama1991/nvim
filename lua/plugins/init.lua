-- ~/.config/nvim/lua/plugins/init.lua

return {
    -- 1. LSP Core Plugins
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {},
        -- Ensure Mason is configured BEFORE lspconfig tries to use it.
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        -- The actual LSP setup is called in lsp.lua
        config = function()
            -- Call the main LSP setup function from your lsp.lua file
            require("plugins.lsp") 
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
    },

    -- 2. Completion Plugins (Lazy-loaded on Insert Mode)
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- Load only when you enter insert mode
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim", -- The plugin for completion menu icons
        },
        -- Configuration is defined in the separate cmp.lua file
        config = function()
            require("plugins.cmp")
        end
    },

    -- 3. Colorscheme
    -- {'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {style = "moon"}},

    -- 4. TreeSitter and Text Objects
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "javascript", "typescript", "json", "bash","html","css","json" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
    
    -- Add your other plugins here (e.g., bufferline, nvim-tree, etc.)
}
