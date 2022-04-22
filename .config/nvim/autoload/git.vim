" Split file in new tab.
function git#SplitInNewTab()
    let file = split(getline("."))[1]
    execute ":tabnew"
    execute ":e" file
    execute ":Gvdiffsplit!"
endfunction

function git#ListFiles()
  if $GIT_DIR == "/Users/tids.user/.cfg"
    execute ":GFiles"
  else
    execute "lua require('telescope.builtin').git_files()"
  endif
endfunction
