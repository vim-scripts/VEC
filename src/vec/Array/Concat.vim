""
" Array:Concat ( array1, array2 )
"
" Returns the concatenated arrays.
"
" @array1  the first array to concatenate
" @array2  the second array to concatenate
"
" TODO
"
function! Array:Concat(array1, array2)
	let s:cn_con = 1
	if (!Array:Exists(a:array1) || !Array:Exists(a:array2))
		if (!Array:Exists(a:array1))
			echoerr 'The array ' . "'" . a:array1 . "'" . ' does not exist.'
			let s:cn_con = 0
		elseif (!Array:Exists(a:array2))
			echoerr 'The array ' . "'" . a:array2 . "'" . ' does not exist.'
			let s:cn_con = 0
		endif
	endif
	if (s:cn_con)
		let s:cn_tmp = 'cn_tmp_' . g:__int_lst
		call Array:New(s:cn_tmp)
		return Array:GetID(s:cn_tmp) .
			\ Array:RawProper(
				\ Array:GetRawData(a:array1) . Array:GetRawData(a:array2)
			\ )
	endif
endfunction
