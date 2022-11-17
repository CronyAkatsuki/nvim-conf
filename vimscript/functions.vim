autocmd InsertEnter * norm zz

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

nmap <silent> <F4> :call Spell_check() <CR>

function! Spell_check()
    set spell spelllang=en_us
    set complete+=kspell
    set completeopt=menuone,longest
    set shortmess+=c
    nnoremap <leader>s ea<C-X><C-S>
    nnoremap <leader>p [s
    nnoremap <leader>n ]s
    nnoremap <leader>a zg
    nnoremap <leader>r zug
    inoremap <buffer> <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"
endfunction
"
" function! NetrwMapping()
"     nmap <buffer> H u
"     nmap <buffer> h -^
"     nmap <buffer> l <CR>
"
"     nmap <buffer> . gh
"     nmap <buffer> P <C-w>z
"
"     nmap <buffer> L <CR>:Lexplore<CR>
"     nmap <buffer> <Leader>dd :Lexplore<CR>
"
"     nmap <buffer> <TAB> mf
"     nmap <buffer> <S-TAB> mF
"     nmap <buffer> <Leader><TAB> mu
"
"     nmap <buffer> ff %:w<CR>:buffer #<CR>
"     nmap <buffer> fe R
"     nmap <buffer> fc mc
"     nmap <buffer> fC mtmc
"     nmap <buffer> fx mm
"     nmap <buffer> fX mtmm
"     nmap <buffer> f; mx
"
"     nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
"
"     nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
"
"     nmap <buffer> fd mtfq
"
"     nmap <buffer> bb mb
"     nmap <buffer> bd mB
"     nmap <buffer> bl gb
" endfunction
"
" augroup netrw_mapping
"     autocmd!
"     autocmd filetype netrw call NetrwMapping()
" augroup END
