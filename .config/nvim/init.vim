syntax on

set mouse=a
set clipboard+=unnamedplus
set number
set relativenumber
set tabstop=4  softtabstop=4
set shiftwidth=4
set smartindent
set smartcase
set expandtab
set undodir=~/.local/share/nvim/undodir/
set undofile 
set backup
set backupdir=~/.local/share/nvim/backup//
set backupcopy=yes
"set nobackup
"set dir=~/.vim/swp/
set noswapfile
set incsearch
set hlsearch
set inccommand=nosplit
set cursorline
set splitright splitbelow
set termguicolors
set laststatus=2
set showtabline=2
"set colorcolumn=80
filetype plugin on
set nocompatible
set encoding=utf-8
set ignorecase

"theme configuration
set background=dark
let g:sonokai_style = 'default'
"sonokai themes = 'default' 'atlantis' 'andromeda' 'shusia' 'maia'
let g:tokyonight_style = 'night' " available: night, storm
colorscheme sonokai
"themes: monokai one-monokai one dracula codedark tokyonight sonokai

"highlighting
"highlight LineNr guifg=lightgreen
"highlight CursorLineNr guifg=grey 

"light theme cursor color for xterm, urxvt and termite
"if &term =~ "xterm\\|rxvt"
"  let &t_SI = "\<Esc>]12;black\x7"
"  let &t_EI = "\<Esc>]12;grey\x7"
"  silent !echo -ne "\033]12;grey\007"
"  " reset cursor when vim exits
"  autocmd VimLeave * silent !echo -ne "\033]112\007"
"endif

"shortcuts and essentials
nnoremap i :nohls<cr>i
"to clear last search let @/=""
"autocmd InsertEnter * norm zz

"navigate splits
map <C-j> <C-w>J
map <C-k> <C-w>K
map <C-l> <C-w>L
map <C-h> <C-w>H

"moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"copy and paste
inoremap <C-v> <Esc>"+p<Esc>ha
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+x

"netrw configuration :Explorer
let g:netrw_banner=0
let g:netrw_liststyle=3 
let g:netrw_winsize=20
let g:netrw_browse_split=4

"cursor configuration
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
let &t_ut=''

"c++ syntax highlighting
let g:cpp_member_variable_highlight = 1

"nerd tree configuration
nmap <C-t> :NERDTreeToggle<CR>

"undo tree configuration
nnoremap <Leader>ut :UndotreeToggle<CR>

"fzf configuration
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height':0.8,
      \'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_COMMAND ='find'
" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

"Indent line customization
"let g:indentLine_char = '|'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
autocmd VimEnter,BufEnter * IndentLinesReset

"current word plugin configuration
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0

"vim wiki configuration
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

source ~/.config/nvim/plug-config/lightline.vim
source ~/.config/nvim/plug-config/term.vim
source ~/.config/nvim/plug-config/cocconfig.vim
source /usr/share/doc/fzf/examples/fzf.vim

call plug#begin('~/.config/nvim/plugged')

"Themes for Vim
Plug 'tomasiser/vim-code-dark'                  "vscode theme
Plug 'rakr/vim-one'                             "one theme
Plug 'crusoexia/vim-monokai'                    "monokai theme
Plug 'sainnhe/sonokai'                          "sonokai theme
Plug 'dracula/vim', { 'as': 'dracula' }         "dracula theme
Plug 'fratajczak/one-monokai-vim'               "one monokai theme
"Extra
Plug 'vimwiki/vimwiki'                          "personal wiki
"Distraction free writing
Plug 'junegunn/goyo.vim'                        "focus writing
Plug 'junegunn/limelight.vim'                   "focus writing
"Development Tools
Plug 'preservim/nerdtree'                       "nerd tree
Plug 'ryanoasis/vim-devicons'                   "icons for tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "icon highlighting
Plug 'terryma/vim-multiple-cursors'             "multi cursor for vim
Plug 'itchyny/lightline.vim'                    "lightline statusbar
Plug 'Yggdroot/indentLine'                      "specify indentation
Plug 'dominikduda/vim_current_word'             "highlight variable
Plug 'mbbill/undotree'                          "undo tree
Plug 'junegunn/fzf.vim'                         "fzf integration
Plug 'antoinemadec/coc-fzf'                     "coc+fzf integration
"git integration
Plug 'airblade/vim-gitgutter'                   "color signs
Plug 'tpope/vim-fugitive'                       "git tool
Plug 'tpope/vim-rhubarb'                        "fugitive + GBrowse
"terminal
Plug 'voldikss/vim-floaterm'                    "Floating terminal
"commenting
Plug 'preservim/nerdcommenter'                  "code commenter
Plug 'tpope/vim-commentary'                     "code commenter
"Syntax Highlighters
Plug 'sheerun/vim-polyglot'                     "syntax for languages
Plug 'uiiaoo/java-syntax.vim'                   "extra syntax for java
Plug 'octol/vim-cpp-enhanced-highlight'         "extra syntax for c++
Plug 'yuezk/vim-js'                             "extra syntax for js
"Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete for nvim
Plug 'honza/vim-snippets'                       "snippets 
"Web Development Tools
Plug 'turbio/bracey.vim',{'do': 'npm install --prefix server'} "live preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/emmet-vim'                          "emmet for vim
Plug 'alvan/vim-closetag'                       "auto close tag
Plug 'tpope/vim-surround'                       "auto rename tag + extra

call plug#end()

