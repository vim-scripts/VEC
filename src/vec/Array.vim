""
" Internal settings
"
let g:__esc_chr = '\\'
let g:__sep_chr = '|'
let g:__att_chr = '='
let g:__aid_reg = 'A\d\{-}:P\d\{-}:@'

""
" Initialization
"
let g:__int_lst = 0

""
" Include components
"
call SourceFiles($VEC . '/Array')
