set noshowmode

"few git features
function! Lightlinegit()
      let l:branch = FugitiveHead()
      return l:branch ==# '' ? '' : ' ' . l:branch . ' ' .
                        \ join(filter(map(['+','~','-'], {i,v -> v.':'.GitGutterGetHunkSummary()[i]}), 'v:val[-1:]'), ' ')
endfunction

"function! GitGutter()
"  return join(filter(map(['+','~','-'], {i,v -> v.':'.GitGutterGetHunkSummary()[i]}), 'v:val[-1:]'), ' ')
"endfunction

"filename respective to window size
function! FilenameForLightline()
      if winwidth(0) > 80
            return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:~:p')
      else
            return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t')
      endif
endfunction

"symbol for filename, encoding, filetype, extra...
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

"customized tabline
function! TabLineFilename(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr)) . ' ' . fnamemodify(bufname(l:bufnr),':t')
endfunction

"lightline configuration
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'git', 'readonly', 'filename', 'tag', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat','filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'tab_component_function': {
      \   'filename': 'TabLineFilename',
      \ },
      \ 'component_function': {
      \   'git': 'Lightlinegit',
      \   'filename' : 'FilenameForLightline',
      \   'readonly' : 'LightLineReadOnly',
      \   'fileformat': 'LightlineFileformatandEncoding',
      \   'filetype' : 'LightlineFiletype'
      \ },
      \ 'component': {
      \   'tag' : "%{tagbar#currenttag('%s', '', 'f', 'scoped-stl')}",
      \   'lineinfo': "%{printf('%d:%d/%d', line('.'),col('.'),  line('$'))}"
      \ },
\ }

