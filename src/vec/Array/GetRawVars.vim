""
" Array:GetRawVars ( array )
"
" Returns an array containing the variable names from the argument array.
"
" @array  the argument array object
"
" --- TODO --- MAJOR ---
"
function! Array:GetRawVars(array)
	if (Array:Exists(a:array))
		let s:rv_count = 0
		let s:rv_nraw = g:__sep_chr
		let s:rv_raw = Array:GetRawData(a:array)
		while (s:rv_count >= 0)
			let s:rv_count = match(s:rv_raw, g:__sep_chr, s:rv_count + 1)
			let s:rv_nm = match(s:rv_raw, g:__sep_chr, s:rv_count + 1)
			let s:rv_nm = s:rv_nm ? s:rv_nm : 0
			let s:rv_nraw =
				\ Array:RawProper(
					\ s:rv_nraw .
					\ substitute(
						\ strpart(s:rv_raw, s:rv_count, strlen(s:rv_raw) - s:rv_count) .
							\ g:__sep_chr,
						\ g:__sep_chr . '\?\<\(\w\{-}\)\>=\_.\{-}' . g:__sep_chr, 'z=\1', ''
					\ )
				\ )
		endwhile
		return s:rv_nraw
	endif
endfunction
