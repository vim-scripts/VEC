""
" Array:Contains ( array, variable )
"
" Returns true if an array contains a certain variable.
"
" @array     the array object
" @variable  the variable to verify
"
function! Array:Contains(array, variable)
	return
		\ (Array:Exists(a:array) ? 
			\ (match(g:{a:array},
			\ g:__sep_chr . '\<' . a:variable . '\>' . g:__att_chr) > -1)
		\ : 0)
endfunction
