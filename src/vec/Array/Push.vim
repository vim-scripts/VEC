""
" Array:Push ( array, variable, value, [ flags ] )
"
" Pushes a variable in an array.
" If the variable already exists in the array, it gets overwritten.
"
" @array     the array object
" @variable  the variable name to push
" @value     the value of the variable
" @flags     optional flags
" 
" The flags can consist of:
"
" d          don't push the variable in the array, if the array already
"            contains it
" l          don't interpret the first character in the value as an operator;
"            instead, include it literally in the string to be overwritten
"
" The value of the variable can contain:
" string     the value gets overwritten
" +object    the value gets added the the previous value
" -object    the value gets substituted from the previous value
" *object    the value gets multiplied with the previous value
" /object    the previous value gets divided by object
" .object    the value gets appended to the previous value
"
" where "object" is either a string or an integer.
" 
" If you would like to include a literal "+", "-", "*" or "." as the first
" character in a string to be overwritten, use the "l" flag.
" 
" The string will automatically be overwritten if the object does not match
" the operator (for example, "+a" will be overwritten, while "+1" will be
" added).
"
" To increment or decrement the variable by 1, use "++" or "--", respectively.
" 
" If the variable is not already defined in the array, the operators will have
" no effect.
"
function! Array:Push(array, variable, value, ...)
	if (Array:Exists(a:array, 1))
		let s:add = 1
		let s:ap_flags = ''
		if (a:0)
			let s:ap_flags = a:1
			if (s:ap_flags =~ 'd')
				let s:add = !Array:Contains(a:array, a:variable)
			endif
		endif
		if (s:add)
			let s:old_value = Array:Pop(a:array, a:variable)
			let s:new_value = a:value
			if (s:ap_flags !~ 'l')
				if (s:new_value =~
					\ '^\%(\([+-]\)\%(\d\+\|\1\)\|\%([\*\/]\d\+\)\|\..\+\)$'
					\ )
					let s:ap_op = strpart(s:new_value, 0, 1)
					let s:ap_arg = strpart(s:new_value, 1, strlen(s:new_value)-1)
					if (s:ap_arg == s:ap_op && s:ap_op =~ '[+-]')
						let s:ap_arg = 1
					endif
					execute 'let s:new_value = s:old_value ' . s:ap_op . ' s:ap_arg'
				endif
			endif
			let g:{a:array} = g:{a:array} . a:variable . g:__att_chr . 
				\ substitute(s:new_value, g:__sep_chr, g:__esc_chr . g:__sep_chr, 'g') .
				\ g:__sep_chr
		endif
	endif
endfunction
