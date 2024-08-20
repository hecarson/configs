-- explore
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- info
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float)

-- copy/paste with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>yy", [["+yy]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- no highlight search
vim.keymap.set("n", "<leader>n", function()
    vim.cmd("nohlsearch")
end)
