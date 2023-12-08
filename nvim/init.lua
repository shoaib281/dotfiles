vim.opt.number = true        -- displays numbers on the side
vim.opt.relativenumber = true

vim.opt.ignorecase = true -- pattern matching

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.title = true
vim.opt.titlestring = "%t"

vim.opt.showmode = false -- airline is used instead

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_keymap("i", "{", "{}<esc>ha", {noremap = true})
vim.api.nvim_set_keymap("i", "[", "[]<esc>ha", {noremap = true})
vim.api.nvim_set_keymap("i", "(", "()<esc>ha", {noremap = true})
vim.api.nvim_set_keymap("i", '"', '""<esc>ha', {noremap = true})
vim.api.nvim_set_keymap("i", "<", "<><esc>ha", {noremap = true})

-- plugins

local plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")

--plug("EdenEast/nightfox.nvim", {["as"] = "nightfox"}) -- colorscheme
plug("catppuccin/nvim", {["as"] = "catppuccin"}) -- colorscheme

plug("nvim-tree/nvim-tree.lua", {["as"] = "nvim-tree"}) -- tree
plug("nvim-tree/nvim-web-devicons") -- tree

plug("vim-airline/vim-airline") --pooewrline/airline
plug("vim-airline/vim-airline-themes") -- themes

vim.call("plug#end")

require("nvim-tree").setup()
require("catppuccin").setup({
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    integrations = {
		nvimtree = true,
    },
})

vim.g.airline_theme = "catppuccin"

vim.cmd("colorscheme catppuccin")
