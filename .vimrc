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
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
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
" Ale
let g:ale_linters = {
\   'c': ['clang'],
\   'css': ['prettier'],
\   'dockerfile': ['dockerfile_lint'],
\   'handlebars': ['prettier'],
\   'html': ['prettier'],
\   'java': ['javac'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'lua': ['luac'],
\   'markdown': ['prettier'],
\   'python': ['autopep8'],
\   'sass': ['sasslint'],
\   'scss': ['prettier'],
\   'sh': ['sh-language-server'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier', 'eslint'],
\   'vim': ['vint'],
\   'vue': ['prettier'],
\}
let g:ale_fix_on_save = 1

" Ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

" Emmet
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'

" Fzf
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \		    <bang>0 ? fzf#vim#with_preview('up:60%')
  \		    	    : fzf#vim#with_preview('right:50%:hidden', '?'),
  \		    <bang>0)

" NERDCommenter
let mapleader=","
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

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
"########################################"
