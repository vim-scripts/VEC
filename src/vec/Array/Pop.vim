""
" Array:Pop ( array, variable )
"
" Removes a variable from an array, and returns it's value, if the variable
" exists in the specified array.
"
" @array     the array object
" @variable  the variable to be retreived
"
function! Array:Pop(array, variable)
	if (Array:Exists(a:array, 1) && Array:Contains(a:array, a:variable))
		let s:val = Array:Get(a:array, a:variable)
		let g:{a:array} = 
			\ Array:GetID(a:array) .
			\ Array:RawProper(
				\ substitute(
					\ Array:GetRawData(a:array),
					\ g:__sep_chr . '\?\<' . a:variable .
						\ '\>' . g:__att_chr . '\_.\{-}\%(' . g:__esc_chr . '\)\@<!' .
						\ g:__sep_chr,
					\ g:__sep_chr, 'g'
				\ )
			\ )
		return s:val
	endif
endfunction
