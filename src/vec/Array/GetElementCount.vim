""
" Array:GetElementCount ( array )
"
" Returns the number of elements contained by an array.
"
" @array  the array object
"
function! Array:GetElementCount(array)
	if (Array:Exists(a:array))
		let s:ec_str = Array:GetRawData(a:array)
		let s:ec_count = 0
		let s:ec_lastmatch = 0
		if (match(s:ec_str, g:__att_chr))
			while (s:ec_lastmatch >= 0)
				let s:ec_lastmatch = match(s:ec_str, g:__att_chr, s:ec_lastmatch+1)
				let s:ec_count = s:ec_count + 1
			endwhile
		else
			return 0
		endif
		return s:ec_count-1
	else
		return -1
	endif
endfunction
