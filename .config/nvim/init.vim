"####################
"      Plugins
"####################
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/colorizer'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript', 'javascriptreact'] }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'phaazon/hop.nvim'
Plug 'Yggdroot/indentLine'
Plug 'valloric/matchtagalways'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'philrunninger/nerdtree-visual-selection', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'arcticicestudio/nord-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'qpkorr/vim-bufkill'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mlaursen/vim-react-snippets', { 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
"########################################"

"########################################"
"            General Settings
"########################################"
" Leader
let mapleader=","

" Map source neovim config
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Enable filetype plugins and indent
filetype plugin indent on

" Clipboard
vnoremap <C-c> "+y

" Syntax highlighting
syntax on

" Visual wrapping
set linebreak
set breakindent

" Mouse
set mouse=a

" Line numbers
set number relativenumber
set cursorline
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber cursorline
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber nocursorline
augroup END

" Map escape key
:inoremap jj <Esc>

" Split
set splitbelow
set splitright
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tp :tabclose<CR>
nnoremap gw :Window<CR> 

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Paste without auto indentation
nnoremap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>"

" Buffer
set hidden
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
"nnoremap gd :BD<CR>

" String encoding
set encoding=utf8

" Disable search highlight
set nohlsearch

" Change cursor between modes
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

" Don't wrap text when typing
set formatoptions-=t

" Allow backspace for indents and newline
set backspace=indent,eol,start

" Fold
autocmd BufWinEnter * normal zR

" Quickfix list
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

" Color scheme
colorscheme nord
if exists('+termguicolors')
  set termguicolors " True color support (https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
endif
"########################################"

"########################################"
"            Plugin Settings
"########################################"
" Ale
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>
nnoremap ]A :ALELast<CR>
nnoremap [A :ALEFirst<CR>
nnoremap <leader>ap :ALEFix prettier<CR>

" Colorizer
nnoremap <leader>co :ColorToggle<CR>

" Emmet
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'

" Hop
lua << EOF
require'hop'.setup()
vim.api.nvim_set_keymap('', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
EOF

" IndentLine
let g:indentLine_fileTypeExclude = ['startify']
let g:indentLine_char = '⦙'

" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader><C-n> :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers=1

" Nord-vim
let g:nord_cursor_line_number_background = 1

lua << EOF
require'nvim-web-devicons'.setup {default = true}
EOF

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

" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader><C-p> :call<Space>git#ListFiles()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap gb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Treesitter
nnoremap <leader>to :TSBufEnable highlight<CR>
nnoremap <leader>tf :TSBufDisable highlight<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" Vim-airline
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

" {{{ Vim-fugitive
nnoremap <leader>gdv :Gvdiffsplit!<CR>
nnoremap <leader>gdh :diffget //2<CR>
vnoremap <leader>gdh :diffget //2<CR>
nnoremap <leader>gdl :diffget //3<CR>
vnoremap <leader>gdl :diffget //3<CR>
nnoremap <leader>gdg :diffget<CR>
nnoremap <leader>gdp :diffput<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gs :tab G<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>ge :tabnew<CR>:Gedit<Space>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :tabnew<CR>:Gclog<CR>
nnoremap <leader>ogl :tabnew<Space>%<CR>:0Gclog<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :terminal git push<CR>
nnoremap <leader>gpl :terminal git pull<CR>

" Map '..' to open parent tree.
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Auto-clean fugitive buffers.
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

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

" Vim-startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']        },
      \ { 'type': 'files',     'header': ['   Files']             },
      \ { 'type': 'dir',       'header': ['   Current directory '. getcwd()]  },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': 'commands',  'header': ['   Commands']        },
      \ ]
"########################################"
