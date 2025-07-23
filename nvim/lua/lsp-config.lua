require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
})

-- Enable signature hint for jdtls
vim.lsp.config("jdtls", {
    settings = { java = { signatureHelp = { enabled = true } } },
})

-- https://cmp.saghen.dev/installation
require("blink.cmp").setup({
    keymap = { preset = "default" },
    sources = {
        defaults = {"lsp", "path", "snippets", "buffer"},
    },
    signature = { enabled = true, window = { show_documentation = true } },
})
