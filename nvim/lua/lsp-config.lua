require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
})

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
    },
})

--require("lsp_signature").setup({
--    hint_enable = false,
--})
