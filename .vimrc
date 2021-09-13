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
set undodir=~/.vim/undodir/
set undofile 
set backup
set backupdir=~/.vim/backup//
set backupcopy=yes
"set nobackup
"set dir=~/.vim/swp/
set noswapfile
set incsearch
set hlsearch
set cursorline
set splitright splitbelow
set termguicolors
set laststatus=2
set showtabline=2
"set colorcolumn=80
filetype plugin on
set nocompatible
set encoding=utf-8

"theme configuration
set background=dark
let g:sonokai_style = 'default'
"sonokai themes = 'default' 'atlantis' 'andromeda' 'shusia' 'maia'
let g:tokyonight_style = 'night' " available: night, storm
colorscheme monokai
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

"color highlighting configuration
autocmd VimEnter,BufEnter,TabEnter * if &buftype !~ 'terminal' | exec "ColorHighlight" | endif

"c++ syntax highlighting
let g:cpp_member_variable_highlight = 1

"vim multi cursor configuration
let g:multi_cursor_select_all_key = '<C-a>'

"nerd tree configuration
nmap <C-t> :NERDTreeToggle<CR>

"undo tree configuration
nnoremap <Leader>ut :UndotreeToggle<CR>

"Indent line customization
"let g:indentLine_char = '|'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '·'

"current word plugin configuration
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0

"vim wiki configuration
let g:vimwiki_list = [{'path': '~/.vim/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"auto pair configuration
let g:AutoPairsFlyMode = 0

"instant markdown preview configuration
let g:instant_markdown_python = 1

""tagbar configuration
nmap <Leader>o :TagbarToggle<CR>
nnoremap g] :call tagbar#jumpToNearbyTag(1, 'nearest', 's')<CR>
nnoremap g[ :call tagbar#jumpToNearbyTag(-1, 'nearest', 's')<CR>
"let g:tagbar_left = 1

"prettier customization
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
nmap <Leader>f <Plug>(Prettier)

source ~/.vim/plug-config/lightline.vim
source ~/.vim/plug-config/term.vim
source ~/.vim/plug-config/ultisnip.vim

call plug#begin('~/.vim/plugged')

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
Plug 'preservim/tagbar'                         "outline bar
Plug 'terryma/vim-multiple-cursors'             "multi cursor for vim
Plug 'itchyny/lightline.vim'                    "lightline statusbar
Plug 'jiangmiao/auto-pairs'                     "bracket auto pairs
Plug 'Yggdroot/indentLine'                      "specify indentation
Plug 'dominikduda/vim_current_word'             "highlight variable
Plug 'mbbill/undotree'                          "undo tree
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
Plug 'ycm-core/YouCompleteMe'                   "autocompletion tool
Plug 'SirVer/ultisnips'                         "snippets
Plug 'honza/vim-snippets'                       "snippets 
"Web Development Tools
Plug 'turbio/bracey.vim',{'do': 'npm install --prefix server'} "live preview
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'mattn/emmet-vim'                          "emmet for vim
Plug 'chrisbra/Colorizer'                       "background Colorizer
Plug 'prettier/vim-prettier', { 'do': 'npm install' } "prettier 
Plug 'alvan/vim-closetag'                       "auto close tag
Plug 'tpope/vim-surround'                       "auto rename tag + extra

call plug#end()

"gvim fonts
if has("gui_running")
    set guifont=FiraCode\ Nerd\ Font\ 12
endif

