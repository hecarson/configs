-- Explore
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Copy/paste with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>yy", [["+yy]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- No highlight search
vim.keymap.set("n", "<leader>n", function()
    vim.cmd("nohlsearch")
end)

-- LaTeX compile
vim.keymap.set("n", "<leader>lc", function()
    if vim.bo.filetype ~= "tex" then
        print("Not in a TeX file!")
        return
    end
    vim.cmd("w")
    vim.cmd("!pdflatex %")
end)

-- Faster exit from terminal mode
vim.keymap.set("t", "<A-[>", "<C-\\><C-N>")
