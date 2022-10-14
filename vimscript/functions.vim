autocmd InsertEnter * norm zz

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" nmap <silent> <F4> :call Spell_check() <CR>
"
" function! Spell_check()
"     set spell spelllang=en_us
"     set complete+=kspell
"     set completeopt=menuone,longest
"     set shortmess+=c
"     nnoremap <leader>s ea<C-X><C-S>
"     nnoremap <leader>p [s
"     nnoremap <leader>n ]s
"     nnoremap <leader>a zg
"     nnoremap <leader>r zug
"     inoremap <buffer> <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"
" endfunction
