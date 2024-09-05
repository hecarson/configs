vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.mouse = ""

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



-- https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = { {import = "plugins"} },
    install = { colorscheme = {"kanagawa"} },
    checker = { enabled = true },
})



require("lsp")
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

vim.cmd("colorscheme kanagawa")
