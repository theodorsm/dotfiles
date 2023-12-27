return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
      pattern = { "bib", "tex" },
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })

    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_syntax_conceal_disable = 1
    vim.g.vimtex_compiler_enabled = 1
    vim.g.vimtex_compiler_silent = 1
    vim.g.vimtex_view_forward_search_on_start = 0
    vim.g.vimtex_grammar_textidote = { jar = "/home/theodor/builds/textidote.jar" }
    vim.g.vimtex_toc_config = { layer_status = { include = 0, label = 0 }, show_help = 0 }
  end,
}
