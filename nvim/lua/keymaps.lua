-- Explore
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Copy/paste with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- no highlight search
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

-- Plugin keymaps

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find file
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- find grep
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- find help

local dap = require("dap")
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F8>", function() dap.step_over() end)
vim.keymap.set("n", "<F7>", function() dap.step_into() end)
vim.keymap.set("n", "<S-F7>", function() dap.step_out() end)
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end) -- debug REPL
vim.keymap.set("n", "<leader>dq", function() dap.terminate() end) -- debug quit
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end) -- debug breakpoint

local dapui = require("dapui")
vim.keymap.set("n", "<leader>dt", dapui.toggle) -- debug toggle
