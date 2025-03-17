if exists('g:loaded_FullHalfWidthTranslator.vim_plugin')
    finish
endif
let g:loaded_FullHalfWidthTranslator_plugifn = 1

" 使用包装函数的映射
nnoremap <silent> <Plug>(FullWidth2HalfWidth) :set operatorfunc=FullHalfWidthTranslator#HalfWidthOperator<CR>g@
vnoremap <silent> <Plug>(FullWidth2HalfWidth) :<C-u>call FullHalfWidthTranslator#HalfWidthOperator(visualmode())<CR>

nnoremap <silent> <Plug>(HalfWidth2FullWidth) :set operatorfunc=FullHalfWidthTranslator#FullWidthOperator<CR>g@
vnoremap <silent> <Plug>(HalfWidth2FullWidth) :<C-u>call FullHalfWidthTranslator#FullWidthOperator(visualmode())<CR>

nnoremap <silent> <Plug>(ToggleFullWidthHalfWidth) :set operatorfunc=FullHalfWidthTranslator#ToggleWidthOperator<CR>g@
vnoremap <silent> <Plug>(ToggleFullWidthHalfWidth) :<C-u>call FullHalfWidthTranslator#ToggleWidthOperator(visualmode())<CR>

" 设置操作符映射键
" Map converting to half-width
" nnoremap gwh <Plug>(FullWidth2HalfWidth)
" vnoremap gwh <Plug>(FullWidth2HalfWidth)

" Map converting to full-width
" nnoremap gwf <Plug>(HalfWidth2FullWidth)
" vnoremap gwf <Plug>(HalfWidth2FullWidth)

" Map toggling width
" nnoremap gwt <Plug>(ToggleFullWidthHalfWidth)
" vnoremap gwt <Plug>(ToggleFullWidthHalfWidth)

" 定义命令
command! -nargs=1 -range TranslateWidthTo :<line1>,<line2>call FullHalfWidthTranslator#ApplyTranslation(<q-args>)
nnoremap <silent> <Plug>(Translate2HalfWidth) :TranslateWidthTo halfWidth<CR>
nnoremap <silent> <Plug>(Translate2FullWidth) :TranslateWidthTo fullWidth<CR>
nnoremap <silent> <Plug>(Translate2ToggleWidth) :TranslateWidthTo toggleWidth<CR>


" 定义映射键
" nnoremap gwhh <Plug>(Translate2HalfWidth)
" nnoremap gwff <Plug>(Translate2FullWidth)
" nnoremap gwtt <Plug>(Translate2ToggleWidth)
