-- Enable signature hint for jdtls
vim.lsp.config("jdtls", {
    settings = { java = { signatureHelp = { enabled = true } } },
})

-- https://cmp.saghen.dev/installation
require("blink.cmp").setup({
    keymap = { preset = "default" },
    sources = {
        default = {"lsp", "path", "snippets", "buffer"},
    },
    signature = { enabled = true, window = { show_documentation = true } },
})

vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("jdtls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("texlab")
