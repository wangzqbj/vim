
function! LigthLineGitHEADCommit()
	return FugitiveExecute('rev-parse', '--short', 'HEAD').stdout[0]
endfunction

"----------------------------------------------------------------------
" lightline components
"----------------------------------------------------------------------
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'githead', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'githead': 'LigthLineGitHEADCommit',
      \ },
      \ }

