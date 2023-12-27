function! MarkdownView()
    execute ':cd %:p:h'
    execute '!' . 'pandoc --template eisvogel --listings --number-sections '  '%' . ' -o ' . '%<' . '.pdf'
"    execute '!' . 'docker run --rm --volume "`pwd`:/data" pandoc-template --template eisvogel --listings --number-sections --pdf-engine xelatex'  '%' . ' -o ' . '%<' . '.pdf'
"    execute '!' . 'docker run --rm --volume "`pwd`:/data" pandoc-template --template eisvogel --pdf-engine xelatex'  '%' . ' -o ' . '%<' . '.pdf'
endfunction
nnoremap <leader>v :call MarkdownView()<cr>

" Prompt for spell language
nnoremap <expr> <F1> ":setlocal spell spelllang=" . input("Spell language: ")"
"
nnoremap <F2> :setlocal spell spelllang=en_us<cr>
nnoremap <F3> :setlocal spell spelllang=nb<cr>
