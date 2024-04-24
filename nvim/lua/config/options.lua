-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.wo.wrap = true

vim.opt.relativenumber = false

-- Airline symbols
vim.g.airline_left_sep = ""
vim.g.airline_left_alt_sep = ""
vim.g.airline_right_sep = ""
vim.g.airline_right_alt_sep = ""
vim.g.airline_symbols = { branch = "", readonly = "", linenr = "", colnr = " " }

local hostname = vim.fn.system('hostname -s | tr -d "\n"')
local user = vim.fn.system('echo $USER | tr -d "\n"')

vim.g.airline_section_b = user .. "@" .. hostname

-- Custom stuff
vim.api.nvim_exec(
  [[
  source ~/.config/nvim/vim/custom_funcs.vim
]],
  false
)

-- Disable trailing whitespace
vim.opt.list = false
