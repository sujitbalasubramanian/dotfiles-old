set noshowmode

function! Lightlinegit()
    let l:branch = FugitiveHead()
    return l:branch ==# '' ? '' : ' ' . l:branch
endfunction

function! FilenameForLightline()
      if winwidth(0) > 80
            return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:~:p')
      else
            return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t')
      endif
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightLineReadOnly()
  return &readonly ? '' : ''
endfunction

function! LightlineFileformatandEncoding()
      if exists('*WebDevIconsGetFileFormatSymbol')
            return &fenc . ' ' . WebDevIconsGetFileFormatSymbol()
      endif
            return &fileformat
endfunction

function! LightlineFiletype()
      if exists('*WebDevIconsGetFileTypeSymbol')
            return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' .
                              \ WebDevIconsGetFileTypeSymbol() : 'no ft') : &filetype
      endif
            return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : &filetype
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr)) . ' ' . fnamemodify(bufname(l:bufnr),':t')
endfunction

"lightline configuration
let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'cocstatus', 'currentfunction', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat','filetype' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ 'close' ], ],
  \ },
  \ 'tab_component_function': {
  \   'filename': 'LightlineWebDevIcons',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'Lightlinegit',
  \   'filename' : 'FilenameForLightline',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'readonly' : 'LightLineReadOnly',
  \   'fileformat': 'LightlineFileformatandEncoding',
  \   'filetype' : 'LightlineFiletype'
  \ },
  \ 'component': {
  \   'lineinfo': "%{printf('%d:%d/%d', line('.'),col('.'),  line('$'))}"
  \ },
\ }

