"########################################"
"		 Vundle
"########################################"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"####################
"      Plugins
"####################
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdcommenter'
"####################
call vundle#end()
filetype plugin indent on
"########################################"

"########################################"
" 	       Settings
"########################################"
" Clipboard
set clipboard=unnamedplus

" Syntax highlighting
filetype plugin on
syntax on

" Identation
filetype indent on

" Visual wrapping
set linebreak
set breakindent

" Mouse
set mouse=a

" Line numbers
set number

" Color scheme
let base16colorspace=256
colorscheme base16-ocean
highlight clear LineNr
highlight LineNr ctermfg=8

" Key maps
:imap jj <Esc>
"########################################"

"########################################"
"            Plugin Settings
"########################################"
" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-airline
let g:airline_theme = 'base16_ocean'

" NERDCommenter
let mapleader=","
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
"########################################"
