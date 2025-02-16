vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.lsp.log.set_level("OFF")

function apply_colorscheme()
    vim.cmd("colorscheme kanagawa")
end

require("lazy-config")

require("lsp-config")
require("dap-config")
require("keymaps")

-- Disable TS autoindent for TeX files
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "tex",
        callback = function()
            vim.opt.indentexpr = ""
        end,
    }
)

apply_colorscheme()
