""
" Array:GetID ( array )
"
" Returns the ID of an array.
"
" @array  the array object
"
function! Array:GetID(array)
	if (Array:Exists(a:array))
		return substitute(g:{a:array}, '^\(' . g:__aid_reg . '\).*$', '\1', '')
	else
		return 0
	endif
endfunction
