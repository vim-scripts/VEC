""
" Array:Get ( array, variable, [ flags ] )
"
" Retreives a variable from an array.
" Returns the value of the variable, if the variable exists, or a null string
" if it doesn't.
"
" @array     the array object
" @variable  the variable to be retreived
" @flags     additional flags
"
" The flags can consist of:
"
" r          raw input
"            If 'r' is specified, the @array argument will be expected to be
"            raw array data, instead of an array object name.
"
function! Array:Get(array, variable, ...)
	let s:ag_israw = a:0 ? a:1 =~ 'r' : 0
	return
		\ (Array:Exists(a:array) && Array:Contains(a:array, a:variable)) || s:ag_israw ?
			\ substitute(
				\ substitute(
					\ matchstr(s:ag_israw ? a:array : g:{a:array},
					\ g:__sep_chr . '\<' . a:variable .
						\ '\>' . g:__att_chr . '\_.\{-}\%(' . g:__esc_chr . '\)\@<!' .
						\ g:__sep_chr),
					\ '^.\{-}' . g:__att_chr . '\(.*\)' . g:__sep_chr . '$', '\1', ''),
			\ g:__esc_chr . g:__sep_chr, g:__sep_chr, 'g')
		\ : 0
endfunction
