--[[ opts.lua ]]

local opt = vim.opt
local wo = vim.wo
local bo = vim.bo
local cmd = vim.api.nvim_command

--opt.colorcolumn = '100'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 12
opt.signcolumn= "yes"


opt.encoding = "utf8"
opt.fileencoding = "utf8"


opt.syntax = "ON"
opt.termguicolors = true


opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false


opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4


opt.splitright = true
opt.splitbelow = true

wo.wrap = true
wo.number = true

cmd("colorscheme dracula")

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
