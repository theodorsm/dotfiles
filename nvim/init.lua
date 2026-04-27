-- filter which-key warnings
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
  if msg:match("which") then
    return
  end
  orig_notify(msg, level, opts)
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
