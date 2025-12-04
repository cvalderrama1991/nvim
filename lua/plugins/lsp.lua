-- ~/.config/nvim/lua/plugins/lsp.lua

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Define the servers you want Mason to install automatically
local ensure_installed_servers = {
    'ts_ls', -- JavaScript, TypeScript, NodeJS
    'lua_ls',   -- Lua
    'bashls',   -- Bash and Zsh
    'html',
    'cssls',
    'jsonls',
    'tailwindcss'
}

-- Setup function for Mason and lspconfig
mason_lspconfig.setup({
    ensure_installed = ensure_installed_servers,
    
    -- The key 'handlers' determines how each server is configured
    handlers = {
        -- 1. Default Handler (Used for tsserver and bashls)
        function(server_name)
            lspconfig[server_name].setup({
                -- This function runs every time an LSP server attaches to a buffer
                on_attach = function(client, bufnr)
                    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                    -- Define minimal LSP keybindings here (using your keymaps.lua style)
                    local bufopts = { noremap=true, silent=true, buffer=bufnr }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                    -- Diagnostics
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
                end,
            })
        end,
        
        -- 2. Custom Handler for lua_ls (Recommended for Neovim config files)
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        workspace = {
                            -- Tell LuaLS to recognize 'vim' as a global variable
                            library = vim.fn.stdpath("config") .. "/lua",
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            }
        end
    },
})
