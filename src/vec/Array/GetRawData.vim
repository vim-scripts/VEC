""
" Array:GetRawData ( array )
"
" Returns the raw contents of an array object.
"
" @array  the array object
"
function! Array:GetRawData(array)
	if (Array:Exists(a:array))
		let s:id_end = matchend(g:{a:array}, Array:GetID(a:array))
		return strpart(g:{a:array}, s:id_end, strlen(g:{a:array})-s:id_end)
	else
		return 0
	endif
endfunction
