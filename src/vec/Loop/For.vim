""
" Initialization
"
source $VEC/Array.vim

""
" Loop:For ( start, test, next )
"
" Executes a for loop.
" Returns true if still in the loop.
"
" @start  the start instruction
" @test   the test condition
" @next   the next instruction
"
" Example:
"   while (Loop:For('let g:i=0', 'g:i<10', 'let g:i=g:i+1'))
"     echo 'i=' . g:i
"   endwhile
"
" TODO. EXPERIMENTAL.
"
function! Loop:For(start, test, next)
	if (Array:Get('LoopForArray', 'active') =~ '^0$')
		" The function is called from outside.
		" Initialize.
		let g:loop_last_id =
			\ exists('g:loop_last_id') ? g:loop_last_id + 1 : 1
		let s:loop_id = 'LF' . g:loop_last_id
		let s:lf_temp = 'LoopFor_' . s:loop_id . '_temp'
		if (!Array:Exists('LoopForArray'))
			call Array:New('LoopForArray')
			call Array:Push('LoopForArray', 'active', 0)
			call Array:Push('LoopForArray', 'active_last', 0)
		endif
		let g:{s:lf_temp} = Array:New()
		call Array:Push('LoopForArray', 'active', s:loop_id)
		call Array:Push(s:lf_temp, 'start', a:start)
		call Array:Push(s:lf_temp, 'test', a:test)
		call Array:Push(s:lf_temp, 'next', a:next)
		call Array:Push('LoopForArray', s:loop_id, g:{s:lf_temp})
		execute a:start
		call Loop:For(a:start, a:test, a:next)
	else
		" The function is called recursively.
		" Get the active For element.
		let s:lf_act = Array:Get('LoopForArray', 'active')
		let s:lf_cond = Array:Get(Array:Get('LoopForArray', s:lf_act), 'test', 'r')
		let s:lf_next = Array:Get(Array:Get('LoopForArray', s:lf_act), 'next', 'r')
		if (!s:lf_cond)
			execute s:lf_next
			return 0
		else
			call Array:Push('LoopForArray', 'active', Array:Get('LoopForArray', 'active_last'))
			call Array:Pop('LoopForArray', s:lf_act)
			return 1
		endif
	endif
endfunction
