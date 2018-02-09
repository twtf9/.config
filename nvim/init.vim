" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'neomake/neomake'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
" deoplete sources go here
Plug 'Shougo/unite.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
call plug#end()

colorscheme desert
set rtp+=~/.config/nvim/plugged/
set mouse=
set number
set relativenumber
set expandtab
set shiftwidth=4
set cursorline
set nohlsearch
hi CursorLine term=bold cterm=bold
set lazyredraw
set softtabstop=4
set wildmode=longest:list,full
set noshowmode
set hidden
set completeopt=preview
nnoremap <c-k> :Unite
nnoremap <c-s> :Neomake<CR>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" deoplete options go here
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_start_length=1
let g:deoplete#file#enable_buffer_path=1
" deoplete sources options go here
let g:deoplete#sources#clang#libclang_path='/usr/lib'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang/5.0.1/include'

let g:neomake_cpp_enable_markers=['gcc']
let g:neomake_cpp_gcc_args=["-std=c++14"]

