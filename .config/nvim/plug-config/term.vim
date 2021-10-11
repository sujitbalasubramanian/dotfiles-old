"Terminal configuration
nnoremap th :sp +res10 term://bash<CR>
nnoremap tv :vsp term://bash<CR>
nnoremap tnt :tabnew term://bash<CR>
tnoremap <Leader>th <C-\><C-n>:sp term://bash<CR>
tnoremap <Leader>tv <C-\><C-n>:vsp term://bash<CR>
tnoremap <Leader>tnt <C-\><C-n>:tabnew term://bash<CR>
tnoremap <Esc> <C-\><C-n><CR>
tnoremap <Leader>q <C-\><C-n>:q<CR>
autocmd TermOpen,TermEnter * nnoremap <buffer><Leader>q :q<CR> 
autocmd TermOpen * setlocal rnu! nu!
autocmd BufEnter term://* startinsert
autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i 

