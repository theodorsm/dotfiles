return {
  "saghen/blink.cmp",
  -- Make blink.cmp toggleable
  opts = function(_, opts)
    vim.b.completion = false

    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion
      end,
      set = function(state)
        vim.b.completion = state
      end,
    }):map("<leader>uk")

    opts.enabled = function()
      -- Always disable in markdown
      if vim.bo.filetype == "markdown" then
        return false
      end
      return vim.b.completion ~= false
    end
    return opts
  end,
}
