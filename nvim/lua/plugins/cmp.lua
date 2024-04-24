return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      -- 	if cmp.visible() then
      -- 		cmp.select_next_item()
      -- 	elseif luasnip.expandable() then
      -- 		luasnip.expand()
      -- 	elseif luasnip.expand_or_jumpable() then
      -- 		luasnip.expand_or_jump()
      -- 	elseif check_backspace() then
      -- 		fallback()
      -- 	else
      -- 		fallback()
      -- 	end
      -- end, {
      -- 	"i",
      -- 	"s",
      -- }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      -- 	if cmp.visible() then
      -- 		cmp.select_prev_item()
      -- 	elseif luasnip.jumpable(-1) then
      -- 		luasnip.jump(-1)
      -- 	else
      -- 		fallback()
      -- 	end
      -- end, {
      -- 	"i",
      -- 	"s",
      -- }),
    })
  end,
}
