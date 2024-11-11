return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            keymaps = {
                ["<leader>e"] = "actions.close",
            },
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
