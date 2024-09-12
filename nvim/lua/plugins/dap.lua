return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            -- Keymaps
            local dap = require("dap")
            vim.keymap.set("n", "<F5>", function() dap.continue() end)
            vim.keymap.set("n", "<F8>", function() dap.step_over() end)
            vim.keymap.set("n", "<F7>", function() dap.step_into() end)
            vim.keymap.set("n", "<S-F7>", function() dap.step_out() end)
            vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end) -- debug REPL
            vim.keymap.set("n", "<leader>dq", function() dap.terminate() end) -- debug quit
            vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end) -- debug breakpoint

            -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-gdb

            -- Adapters
            local dap = require("dap")
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }

            -- Configuration
            local c_cpp_config = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                }
            } 
            dap.configurations.c = c_cpp_config
            dap.configurations.cpp = c_cpp_config
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dapui = require("dapui")
            dapui.setup()
            
            -- debug toggle
            vim.keymap.set("n", "<leader>dt", dapui.toggle)

            -- For some reason, this fixes the weird black background of the DAP REPL icons
            vim.cmd("colorscheme kanagawa")
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
