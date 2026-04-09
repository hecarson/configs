-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter").install({
    "c", "lua", "vim", "vimdoc", "query", "asm", "cpp", "latex", "python",
    "javascript", "typescript",
})

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {
            "c", "cpp", "lua", "vim", "asm", "latex", "python", "javascript", "typescript",
            "typescriptreact"
        },
        callback = function()
            vim.treesitter.start()
        end,
    }
)
