""
" Array:Destroy ( array )
"
" Destroys an array.
"
" @array  the array object
"
function! Array:Destroy(array)
	if (Array:Exists(a:array))
		unlet g:{a:array}
		return 1
	endif
	return 0
endfunction
