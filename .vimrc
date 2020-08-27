"########################################"
"		 Vundle
"########################################"
set nocompatible
filetype plugin on
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
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
Plugin 'chrisbra/colorizer'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'valloric/matchtagalways'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'philrunninger/nerdtree-visual-selection'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mvolkmann/vim-js-arrow-function'
Plugin 'elzr/vim-json'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'jdkanani/vim-material-theme'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'valloric/youcompleteme'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ryanoasis/vim-devicons'
Plugin 'HerringtonDarkholme/yats'
"####################
call vundle#end()
filetype plugin indent on
"########################################"

"########################################"
" 	       Settings
"########################################"
" Leader
let mapleader=","

" Clipboard
vnoremap <C-c> "+y

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
set number relativenumber
set cursorline
highlight LineNr ctermfg=14
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber cursorline
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber nocursorline
augroup END
hi CursorLineNr cterm=NONE ctermbg=black ctermfg=grey
hi CursorLine cterm=NONE ctermbg=black

set t_ZH=[3m
set t_ZR=[23m

" Tmux will not affect color scheme 
set background=dark
set t_Co=256

" Key maps
:imap jj <Esc>

" Split
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tp :tabclose<CR>
highlight TabLineFill ctermfg=grey
highlight TabLine cterm=bold ctermbg=darkgrey ctermfg=black
highlight TabLineSel ctermbg=3 ctermfg=black
highlight Title ctermfg=black

" Identation
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
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css
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

" Gnome caret shape
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" Font
set encoding=utf8
set guifont=JetBrainsMono\ Nerd\ Font\ 11
"########################################"

"########################################"
"            Plugin Settings
"########################################"
" Ale
let g:ale_linters = {
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'python': ['autopep8'],
\   'sass': ['sasslint'],
\   'scss': ['prettier'],
\   'sh': ['sh-language-server'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}
let g:ale_fixers = {
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'python': ['autopep8'],
\   'sass': ['sasslint'],
\   'scss': ['prettier'],
\   'sh': ['sh-language-server'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: llvm, IndentWidth: 4}"'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEError cterm=underline ctermbg=NONE ctermfg=NONE
highlight ALEWarning cterm=underline ctermbg=NONE ctermfg=NONE
nmap ]a :ALENextWrap<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]A :ALELast<CR>
nmap [A :ALEFirst<CR>
let g:ale_javascript_prettier_use_local_config = 1

" Colorizer
nnoremap <leader>co :ColorToggle<CR>

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
nnoremap <C-p> :Files<CR> 

" NERDCommenter
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar
nnoremap tg :TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" Vim-airline
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1

" Vim-fugitive
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
vnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
vnoremap gdl :diffget //3<CR>
nnoremap gdp :diffput<CR>
vnoremap gdp :diffput<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gs :tab G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :terminal git push<CR>
nnoremap <leader>gpl :terminal git pull<CR>
hi DiffAdd cterm=none ctermfg=green ctermbg=none
hi DiffDelete cterm=none ctermfg=red ctermbg=none
hi DiffChange cterm=bold ctermfg=none ctermbg=black
hi DiffText cterm=bold ctermfg=darkmagenta ctermbg=black

" Vim-fugitive. Split file in new tab.
function SplitInNewTab()
    let file = split(getline("."))[1]
    execute ":tabnew"
    execute ":e" file
    execute ":Gvdiffsplit!"
endfunction
augroup FugitiveMappings
  autocmd!
  autocmd FileType fugitive nmap <buffer> + :call<Space>SplitInNewTab()<CR>
augroup

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

" YouCompleteMe
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_auto_hover = ''
"########################################"
