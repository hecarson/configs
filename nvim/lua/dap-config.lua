

require("dapui").setup()
apply_colorscheme()

require("dap-python").setup("python")



-- Adapters

-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#c-c-rust-via-gdb
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
        args = function()
            local args_str = vim.fn.input("Args: ")
            local utils = require("dap.utils")
            return utils.splitstr(args_str)
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    }
}
dap.configurations.c = c_cpp_config
dap.configurations.cpp = c_cpp_config
