"Terminal configuration
nnoremap th :term ++rows=10<CR>
nnoremap tv :vert term<CR>
nnoremap tnt :tab term<CR>
tnoremap <Leader>th <C-\><C-n>:term<CR>
tnoremap <Leader>tv <C-\><C-n>:vert term<CR>
tnoremap <Leader>tnt <C-\><C-n>:tab term<CR>
tnoremap <Leader>v <C-\><C-n><CR>
tnoremap <Leader>q <C-\><C-n>:q!<CR>
autocmd TerminalOpen * nnoremap <buffer><Leader>q :q!<CR> 
autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif

