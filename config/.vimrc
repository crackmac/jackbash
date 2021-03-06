" Setup for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" How I manage all my plugins
Bundle 'gmarik/vundle'
" Git support (:Gstatus)
Bundle 'tpope/vim-fugitive'
" Gives me the left side highlighting
Bundle 'scrooloose/syntastic'
" Gives me ; to explore files
Bundle 'wincent/Command-T'
" Manage window sessions with SaveSession
Bundle 'xolox/vim-session'
" Show possible tab completions while editting
Bundle 'Valloric/YouCompleteMe'
" Explore tags (:TlistOpen)
Bundle 'taglist.vim'
" Not really sure why I need this
filetype plugin indent on

" Supports Command-T as ;
map ; :CommandT<CR>

" Source company specific vim settings
source ~/.bash/group/vimrc
" Allos recursive tags file searching
set tags=tags;/

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_enable_highlighting=1
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_check_on_open=1
" Well, this is sad!
let g:syntastic_python_checker_args = '--ignore=E501'

" Highlight over 80 col as red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
set incsearch
set hlsearch
match OverLength /\%81v./
" Search cscope for ctrl + ]
set cscopetag

" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu
" http://stackoverflow.com/questions/3686841/vim-case-insensitive-filename-completion
if exists("&wildignorecase")
    set wildignorecase
endif

" https://github.com/apache/thrift/blob/master/contrib/thrift.vim
au BufRead,BufNewFile *.thrift set filetype=thrift
autocmd FileType thrift :setlocal sw=2 ts=2 sts=2
au! Syntax thrift source ~/.bash/config/thrift.vim

" http://protobuf.googlecode.com/svn-history/r28/trunk/editors/proto.vim
augroup filetype
  au! BufRead,BufNewFile *.proto set filetype=proto
  autocmd FileType proto :setlocal sw=2 ts=2 sts=2
  au! Syntax proto source ~/.bash/config/proto.vim
augroup end
