""
" Vim Extended Classes
"
" Initialization
"
let $VEC = $VECHOME . "/vec/"

""
" SourceFiles ( directory )
"
" Sources all the *.vim files from inside a directory.
"
" @directory  the directory to search for files
"
function! SourceFiles(directory)
	execute 'silent source ' .
		\ substitute(glob(a:directory . '/*.vim'), "[\n\r]", '|source ', 'g')
endfunction

""
" Include components
"
call SourceFiles($VEC)
