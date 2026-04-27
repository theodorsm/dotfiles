local is_dark = true

local function toggle_colorscheme()
  if is_dark then
    vim.o.background = "light"
    vim.o.termguicolors = true
    vim.cmd.colorscheme("solarized")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("base16-tomorrow-night")
  end

  is_dark = not is_dark
end

vim.keymap.set("n", "<leader>ut", toggle_colorscheme, { desc = "Toggle light/dark colorscheme" })
