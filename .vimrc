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
if has('python3') 
endif
Plugin 'sirver/ultisnips'
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'valloric/matchtagalways'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'philrunninger/nerdtree-visual-selection'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'epilande/vim-react-snippets'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'qpkorr/vim-bufkill'
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
set background=dark
set t_Co=256
set t_ut=
highlight clear LineNr
highlight LineNr ctermfg=8

" Key maps
:imap jj <Esc>

" Split
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
au BufNewFile,BufRead *.c,*.cpp,*.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent
au BufNewFile,BufRead *.js,*.json,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set noexpandtab |
    \ set autoindent

" Buffer
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b
nnoremap gd :BD<CR>
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
\   'vue': ['prettier'],
\}
let g:ale_fixers = {
\   'cpp': ['clang-format'],
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
\   'vue': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: llvm, IndentWidth: 4}"'

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

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" Vim-airline
let g:airline_theme = 'base16_ocean'

" Vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-[>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"########################################"
