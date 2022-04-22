let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'eslint']

let b:NERDCustomDelimiters={
  \ 'typescript': { 
  \   'left': '//', 'right': '', 
  \   'leftAlt': '{/*', 'rightAlt': '*/}' 
  \ },
\}
