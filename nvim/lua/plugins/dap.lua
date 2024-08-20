return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<F5>", function() dap.continue() end)
            vim.keymap.set("n", "<F8>", function() dap.step_over() end)
            vim.keymap.set("n", "<F7>", function() dap.step_into() end)
            vim.keymap.set("n", "<S-F7>", function() dap.step_out() end)
            vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end) -- debug REPL
            vim.keymap.set("n", "<leader>dq", function() dap.terminate() end) -- debug quit
            vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end) -- debug breakpoint
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dapui = require("dapui")
            dapui.setup()
            
            -- debug toggle
            vim.keymap.set("n", "<leader>dt", dapui.toggle)
        end,
    },

    {"nvim-neotest/nvim-nio"},

    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("python")
        end,
    },
}
