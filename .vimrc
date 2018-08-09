"
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" program
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

" file
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'

" appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" other
Plug 'vim-utils/vim-man'
Plug 'vimwiki/vimwiki'

call plug#end()

" *****************
" basic set 
" *****************

set number
set cmdheight=2
set showmode
set showcmd
set ruler
set t_Co=256
set background=dark
set nocompatible

" replace tab with space
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" search,highlight,indent
set showmatch
set hlsearch
set incsearch
set autoindent
set smartindent
set cursorline

set dictionary+=/usr/share/dict/words
syntax on
filetype indent plugin on 

autocmd BufWritePost $MYVIMRC source $MYVIMRC     " auto reload .vimrc

" other 
nnoremap <leader>ev :vsplit $MYVIMRC<CR>            " edit .vimrc anywhere
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel       " make word => "word"
nnoremap <leader>h :help <cWORD><CR>

" buffer
nnoremap <C-right> :bn<CR>                          " next buffer
nnoremap <C-left> :bp<CR>                           " previous buffer

" jump
nnoremap <C-j> /<+.\{-1,}+><CR>c/+>/e<CR>           " jump to <+...+> in normal mode
inoremap <C-j> <ESC>/<+.\{-1,}+><CR>c/+>/e<CR>      " jump to <+...+> in insert mode

" complete
inoremap <leader>k <C-x><C-k>                       
" complete words from the dictionary
" <C-x><C-l>: complete whole lines of the text
" <C-x><C-n>: complete words from the current buffer
" <C-x><C-t>: complete words from the thesaurus
" <C-x><C-i>: words from the current and included files


" *****************
" Plug set
" *****************
" NERDTree
"

" open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" map a specific key to open NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

"
" YouCompleteMe
"

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3.6'
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_key_invoke_completion='<leader>;'
let g:ycm_filetype_blacklist={
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,cuda,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

nmap <silent> <F4> :YcmDiags<CR>

"
" Tagbar
"
let g:tagbar_width=30
let g:tagbar_sort=0
nnoremap <silent> <F8> :TagbarToggle<CR>
set tags+=/usr/include/tags

"
" vim-airline
"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_theme='solarized'
let g:solarized_termcolors=256
colorscheme solarized

" 
" vim-eazy-align
"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

