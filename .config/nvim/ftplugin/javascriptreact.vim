let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']

nnoremap <leader>fp <cmd>lua require('treesitter').go_to_parent_jsx_element()<cr>
