set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" my plugins
Plugin 'jiangmiao/auto-pairs'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-sensible'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'alepez/vim-gtest'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'peterhoeg/vim-qml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"Set tab format
set tabstop=2
set shiftwidth=2
set softtabstop=2

"Highlight end column
"set colorcolumn=105
"highlight ColorColumn ctermbg=darkgray

"Turn on relative number
set relativenumber

"Lines numbers
set number

"Tags directory
"set tags=./tags,/usr/include/c++/5.3.1/tags,tags;

"Turn on files searching on tab key"
" :find filename
" :edit filename
" :ls - list open files
" :b - jump to one of the open file
set path+=**
set wildmenu

syntax enable
filetype plugin indent on

"TAGS searching
"Create the 'tags' file
" ^] - find tag
" ^t - jump to previous tag
command! MakeTags !ctags -R .

"AUTOCOMPLETE:
" ^n for anything
" ^x^n for just this current file
" ^x^f for filenames
" ^x^] for tags
" ^p go back in the suggestion list

"Clang formating
let g:clang_format#auto_format = 1
autocmd FileType *.c,*.cpp,*.h ClangFormatAutoEnable

set autowrite
set makeprg=ninja-build\ -C\ %:p:h/../../build/Debug

" Command Make will call make and then cwindow which
" " opens a 3 line error window if any errors are found.
" " If no errors, it closes any open cwindow.
:command -nargs=* Make make <args> | cwindow 5
map <F5> :Make<CR><C-w><Up>

"path to directory where clang can be found for clang_complate
"let g:clang_library_path='/usr/lib/llvm/libclang.so'

let g:ctrlp_custom_ignore = 'build\'
let g:ctrlp_working_path_mode = 0

"Toggle source cpp and header files
map <F3> :call CurtineIncSw()<CR>

"enable/disable highlighting
nnoremap <F4> :set hlsearch! hlsearch?<CR>

"Run google unit tests
nnoremap <F8> :GTestRun<CR>

"Allow project specific .vimrc
set exrc
set secure
