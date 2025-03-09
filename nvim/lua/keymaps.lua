-- Explore
oil = require("oil")
vim.keymap.set("n", "<leader>e", function() oil.open() end)
-- Keymap for closing is in plugins/oil.lua

-- Copy/paste with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

-- Disable ctrl + left mouse
vim.keymap.set("n", "<C-LeftMouse>", function() end)

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

-- find file
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff",
    function()
        builtin.find_files({hidden = true, no_ignore_parent = true})
    end,
    {}
)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- find grep
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- find help
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {}) -- find symbols
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {}) -- find treesitter

local dap = require("dap")
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
vim.keymap.set("n", "<F23>", function() dap.step_out() end) -- shift + f11, inserted with CTRL-K
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end) -- debug REPL
vim.keymap.set("n", "<leader>dq", function() dap.terminate() end) -- debug quit
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end) -- debug breakpoint

local dapui = require("dapui")
vim.keymap.set("n", "<leader>dt", dapui.toggle) -- debug toggle
