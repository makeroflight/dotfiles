"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       ▒█                                                "
"                                                         "
"  ▒█▒█▒██ ▒██▒█ ▒███▒██                                  "
"  ▒█▒█ ▒█ ▒█▒█▒█▒█ ▒█                                    "
"   ▒█  ▒██▒█▒█▒█▒█  ▒██                                  "
"                                                         "
" .vimrc   -   /vim/ noun, definition: energy; enthusiasm "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set spelllang=en

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2

" UI
set showcmd
set wildmenu
set lazyredraw
set showmatch

nnoremap j gj
nnoremap k gk

nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'myusuf3/numbers.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug '~/.fzf' " junegunn/fzf
call plug#end()

" NERDTree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Additional C++ syntax highlighting
autocmd FileType cpp syn keyword Statement std
autocmd FileType cpp syn keyword Type string

" Additional C syntax highlighting
autocmd FileType c syn keyword Statement malloc
autocmd FileType c syn keyword Statement calloc
autocmd FileType c syn keyword Statement free

" New file templates
autocmd BufNewFile *.h r $HOME/.vim/templates/header
autocmd BufNewFile *.hpp r $HOME/.vim/templates/header
autocmd BufNewFile *.tex r $HOME/.vim/templates/tex

" Vim latex live preview
let g:livepreview_previewer = 'zathura'
autocmd FileType tex LLPStartPreview
:set updatetime=500
