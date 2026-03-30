-- Normal mode mappings
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete, Copy and Paste
vim.keymap.set({ "n", "x" }, "<leader>d", '\"_d', { desc = "Delete without yanking" })
vim.keymap.set("x", "<leader>p", [["_d]], { desc = "Paste over visual selection (preserve yanked text" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines up or down using the option key on MacOS
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Move lines up or down using Super key(D) on Linux
vim.keymap.set("n", "<D-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<D-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<D-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<D-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("n", "<D-h>", ":echo 'Super works!'<CR>")

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Copy full current file path
vim.keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copy path:", path)
end, { desc = "Copy absolute path" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    -- Enable omni completion (optional, but fine to keep)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- LSP keymaps (buffer-local)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = ev.buf,
      desc = "Go to definition",
    })

    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
      buffer = ev.buf,
      desc = "Go to implementation",
    })

    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
      buffer = ev.buf,
      desc = "List references",
    })

    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {
      buffer = ev.buf,
      desc = "Go to type definition",
    })

    -- Hover (use K — standard and reliable)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
      buffer = ev.buf,
      desc = "Hover documentation",
    })
  end,
})
