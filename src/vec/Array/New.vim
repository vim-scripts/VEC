""
" Array:New ( [ array ] )
"
" Initializes a new array.
" Returns the array object.
"
" @array  the variable to be instantiated
"
" Example:
"   let variable = Array:New()
"   " or
"   call Array:New('variable')
"
function! Array:New(...)
	let g:__int_lst = g:__int_lst + 1
	let s:id = 'A' . g:__int_lst . ':P0:@' . g:__sep_chr
	if (a:0)
		let g:{a:1} = s:id
	endif
	return s:id
endfunction
