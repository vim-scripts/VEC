""
" String:Occurances ( string, match )
"
" Returns the number of occurances of match in string.
"
" @string  the initial string
" @match   the match to count
"
function! String:Occurances(string, match)
	let s:oc_count = 0
	let s:oc_last = 0
	if (match(a:string, a:match) > -1)
		while (s:oc_last >= 0)
			let s:oc_last = match(a:string, a:match, s:oc_last + 1)
			let s:oc_count = s:oc_count + 1
		endwhile
		return s:oc_count
	else
		return 0
	endif
endfunction
