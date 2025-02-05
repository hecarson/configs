return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-gdb

            -- Adapters
            local dap = require("dap")
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-n", "--interpreter=dap", "--eval-command", "set print pretty on" },
            }

            dap.adapters.javadebug = {
                type = "executable",

            }

            -- Configuration
            local c_cpp_config = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
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

            -- For some reason, this fixes the weird black background of the DAP REPL icons
            apply_colorscheme()
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
