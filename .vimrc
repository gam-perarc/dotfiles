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
Plugin 'neoclide/coc.nvim'
Plugin 'chrisbra/colorizer'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'valloric/matchtagalways'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'philrunninger/nerdtree-visual-selection'
Plugin 'arcticicestudio/nord-vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'delphinus/vim-firestore'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mvolkmann/vim-js-arrow-function'
Plugin 'elzr/vim-json'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tpope/vim-repeat'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ryanoasis/vim-devicons'
Plugin 'xavierchow/vim-swagger-preview'
Plugin 'stephpy/vim-yaml'
Plugin 'HerringtonDarkholme/yats'
"####################
call vundle#end()
filetype plugin indent on
"########################################"

"########################################"
"            General Settings
"########################################"
" Leader
let mapleader=","

" Clipboard
vnoremap <C-c> "+y

" Syntax highlighting
filetype plugin on
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

" Indentation
filetype indent on
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
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css,*.rules
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set noexpandtab |
    \ set autoindent
au BufNewFile,BufRead *.yml,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent

" Buffer
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b
nnoremap gd :BD<CR>

" Font
set encoding=utf8

" Support true color
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Clear search highlight
nnoremap <nowait><silent> <leader><C-l> :noh<CR>
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
\   'sh': ['shfmt'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'yaml': ['prettier'],
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
\   'sh': ['shfmt'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: llvm, IndentWidth: 4}"'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
nmap ]a :ALENextWrap<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]A :ALELast<CR>
nmap [A :ALEFirst<CR>
let g:ale_javascript_prettier_use_local_config = 1

" Coc {----------------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc-css scss add @ to isKeyword option
autocmd FileType scss setl iskeyword+=@-@

" coc-swagger render shortcut
command! -nargs=0 Swagger :CocCommand swagger.render
" ---------------------------------------------------------}

" Colorizer
nnoremap <leader>co :ColorToggle<CR>

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

" IndentLine
let g:indentLine_fileType = ['yml', 'yaml']
let g:indentLine_char = '⦙'

" NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeShowLineNumbers=1

" Nord-vim
let g:nord_cursor_line_number_background = 1
colorscheme nord

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
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

" Vim-fugitive
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
vnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
vnoremap gdl :diffget //3<CR>
nnoremap gdg :diffget<CR>
vnoremap gdg :diffget<CR>
nnoremap gdp :diffput<CR>
vnoremap gdp :diffput<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gs :tab G<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>ge :Gedit
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :terminal git push<CR>
nnoremap <leader>gpl :terminal git pull<CR>

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
  autocmd FileType git nmap <buffer> M O<C-w>H
augroup END

" Vim-fugitive. Map '..' to open parent tree.
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Vim-fugitive. Auto-clean fugitive buffers.
autocmd BufReadPost fugitive://* set bufhidden=delete

" Vim-json
let g:vim_json_warnings=0

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
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Current directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
"########################################"
