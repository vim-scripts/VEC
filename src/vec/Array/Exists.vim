""
" Array:Exists ( array, [ exception ] )
"
" Returns true if a certain array exists.
"
" @array      the array to verify
" @exception  generates an exception if set to 1
"
function! Array:Exists(array, ...)
	let s:vrf = exists("g:" . a:array) && g:{a:array} =~ '^' . g:__aid_reg
	if (a:0 && a:1 && !s:vrf)
		echoerr a:array . " is not an array."
	endif
	return s:vrf
endfunction
