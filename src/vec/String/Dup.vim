""
" String:Dup ( string, count )
"
" Returns the initial string concatenated with itself count times.
"
" @string  the initial string
" @count   the number of duplicates
"
function! String:Dup(string, count)
	let s:dp_count = 0
	let s:dp_string = ''
	if (!a:count > 0)
		return ''
	endif
	if (a:count > 1)
		while (s:dp_count < a:count)
			let s:dp_string = s:dp_string . a:string
			let s:dp_count = s:dp_count + 1
		endwhile
		return s:dp_string
	else
		return a:string
	endif
endfunction
