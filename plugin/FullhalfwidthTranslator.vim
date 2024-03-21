if exists('g:loaded_FullHalfWidthTranslator.vim_plugin')
    finish
endif
let g:loaded_FullHalfWidthTranslator_plugifn = 1

" 定义执行转换的函数
function! FullHalfWidthTranslator#ApplyTransformation(type, widthType)
    let save_cursor = getpos('.')
    let t_save = @k

    if a:type == "\<C-V>"
        " 块选择模式
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
        if column_end < column_start
            let [column_start, column_end] = [column_end, column_start]
        endif
        for line_num in range(line_start, line_end)
            let line = getline(line_num)
            let partToTransform = line[column_start - 1: column_end - 1]
            let transformedPart = FullHalfWidthTranslator#Translate(partToTransform, a:widthType)
            let newLine = line[:column_start - 2] . transformedPart . line[column_end:]
            call setline(line_num, newLine)
        endfor
    else
        " 对其他模式的处理
        if a:type == 'line'
            normal! '[V']
        elseif a:type == 'char'
            normal! `[v`]
        elseif a:type ==? 'v'
            normal! gv
        else
            normal! '[v']
        endif

        normal! "ky
        let selectedText = @k
        echo selectedText
        let transformedText = FullHalfWidthTranslator#Translate(selectedText, a:widthType)
        if transformedText != selectedText
          call setreg('k', transformedText)
          normal! gv"kp
        endif
    endif

    call setreg('k', t_save)
    call setpos('.', save_cursor)
endfunction

" 包装函数
function! FullHalfWidthTranslator#HalfWidthOperator(type) abort
  call FullHalfWidthTranslator#ApplyTransformation(a:type, 'halfWidth')
endfunction

function! FullHalfWidthTranslator#FullWidthOperator(type) abort
  call FullHalfWidthTranslator#ApplyTransformation(a:type, 'fullWidth')
endfunction

function! FullHalfWidthTranslator#ToggleWidthOperator(type) abort
  call FullHalfWidthTranslator#ApplyTransformation(a:type, 'toggleWidth')
endfunction

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

function! FullHalfWidthTranslator#ApplyTranslation(widthType) range
    for lnum in range(a:firstline, a:lastline)
        let line = getline(lnum)
        let transformedText = FullHalfWidthTranslator#Translate(line, a:widthType)
        call setline(lnum, transformedText)
    endfor
endfunction

" 定义命令
command! -nargs=1 -range TranslateWidthTo :<line1>,<line2>call FullHalfWidthTranslator#ApplyTranslation(<q-args>)
nnoremap <silent> <Plug>(Translate2HalfWidth) :TranslateWidthTo halfWidth<CR>
nnoremap <silent> <Plug>(Translate2FullWidth) :TranslateWidthTo fullWidth<CR>
nnoremap <silent> <Plug>(Translate2ToggleWidth) :TranslateWidthTo toggleWidth<CR>


" 定义映射键
" nnoremap gwhh <Plug>(Translate2HalfWidth)
" nnoremap gwff <Plug>(Translate2FullWidth)
" nnoremap gwtt <Plug>(Translate2ToggleWidth)
