""
" Array:RawProper ( rawdata )
"
" Cleans up an array raw data, by removing duplicate separators and other
" redundant information.
"
" @rawdata  the array raw data
"
function! Array:RawProper(rawdata)
	return
		\ substitute(
			\ a:rawdata, g:__sep_chr . '\+', g:__sep_chr, 'g')
endfunction
