syntax on
set hidden
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase       " make searches case-sensitive only if they contain upper-case characters
set cursorline
set switchbuf=useopen
set numberwidth=5
set backspace=indent,eol,start
set showcmd                    " display incomplete commands
set nocompatible               " be iMproved
set fileformats=unix,dos,mac   " support all three, in this order
set foldmethod=syntax
set foldlevel=7
set iskeyword+=:
set cot+=menuone
set number
set showmode ruler
set ruler
set showmatch
set ts=5
set backspace=2
set diffopt+=iwhite
set ai
set hlsearch
highlight Comment ctermfg=green

" Set the statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v]\ [%p%%]\ [LINES=%L]
set laststatus=2
set mousemodel=extend


" Initialize vundle runtime
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle package
Bundle 'gmarik/vundle'

" A file tree explorer
Bundle 'scrooloose/nerdtree'
    " Open it on vim startup
    " autocmd VimEnter * NERDTree
    " Mirror tree position for every buffer
    autocmd BufEnter * NERDTreeMirror
    " Set current dir to vim cwd
    set autochdir
    let NERDTreeChDirMode=2
    " Ctrl+d to toggle NerdTree
    nmap <silent> <C-D> :NERDTreeToggle<CR> 
    " Close nerdtree when it's the only buffer left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Use F9 to fold/unfold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" By pressing Ctrl + R in the visual mode you will be prompted to enter text to replace with. 
" Press enter and then confirm each change you agree with 'y' or decline with 'n'.
" This command will override your register 'h' so you can choose other one 
" ( by changing 'h' in the command above to other lower case letter ) that you don't use.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

filetype indent on
filetype plugin on

set mouse=a
" Force terminal to 256 colors
set t_Co=256
"color flatcolor 
colorscheme sunburst 

" Use tabs with arrow keys, Ctrl+t to open a new tab, and Ctrl+e to close it
map <up> :tabr<cr>
map <down> :tabl<cr>
map <left> :tabp<cr>
map <right> :tabn<cr>
map <C-t> :tabnew<cr>
map <C-e> :tabclose<cr>



" setup for gui
set guioptions-=r  " no scrollbar on the right
set guioptions-=l  " no scrollbar on the left
set guioptions-=m  " no menu
set guioptions-=T  " no toolbar

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 9
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    else
        set guifont=Monaco_for_Powerline
    endif
endif

"set tabline=%!tabber#TabLine()
set tags=tags;

" force two spaces indentation for python files
autocmd Filetype python setlocal ts=2 sts=2 sw=2




