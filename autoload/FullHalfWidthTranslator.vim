"=============================================================================
" File: FullhalfwidthTranslator.vim
" Author: Kun Lin
" Created: 2024-03-17
"=============================================================================

scriptencoding utf-8

function! FullHalfWidthTranslator#Translate(text, widthType)
    let l:mappings = {
      \ '←'  : '￩', '↑'  : '￪', '→'  : '￫', '↓'  : '￬', '│'  : '￨', '■'  : '￭', '○'  : '￮', '　' : ' ', '、' : '､', '。' : '｡',
      \ '「' : '｢', '」' : '｣', 'ァ' : 'ｧ', 'ア' : 'ｱ', 'ィ' : 'ｨ', 'イ' : 'ｲ', 'ゥ' : 'ｩ', 'ウ' : 'ｳ', 'ェ' : 'ｪ', 'エ' : 'ｴ',
      \ 'ォ' : 'ｫ', 'オ' : 'ｵ', 'カ' : 'ｶ', 'キ' : 'ｷ', 'ク' : 'ｸ', 'ケ' : 'ｹ', 'コ' : 'ｺ', 'サ' : 'ｻ', 'シ' : 'ｼ', 'ス' : 'ｽ',
      \ 'セ' : 'ｾ', 'ソ' : 'ｿ', 'タ' : 'ﾀ', 'チ' : 'ﾁ', 'ッ' : 'ｯ', 'ツ' : 'ﾂ', 'テ' : 'ﾃ', 'ト' : 'ﾄ', 'ナ' : 'ﾅ', 'ニ' : 'ﾆ',
      \ 'ヌ' : 'ﾇ', 'ネ' : 'ﾈ', 'ノ' : 'ﾉ', 'ハ' : 'ﾊ', 'ヒ' : 'ﾋ', 'フ' : 'ﾌ', 'ヘ' : 'ﾍ', 'ホ' : 'ﾎ', 'マ' : 'ﾏ', 'ミ' : 'ﾐ',
      \ 'ム' : 'ﾑ', 'メ' : 'ﾒ', 'モ' : 'ﾓ', 'ャ' : 'ｬ', 'ヤ' : 'ﾔ', 'ュ' : 'ｭ', 'ユ' : 'ﾕ', 'ョ' : 'ｮ', 'ヨ' : 'ﾖ', 'ラ' : 'ﾗ',
      \ 'リ' : 'ﾘ', 'ル' : 'ﾙ', 'レ' : 'ﾚ', 'ロ' : 'ﾛ', 'ワ' : 'ﾜ', 'ヲ' : 'ｦ', 'ン' : 'ﾝ', '・' : '･', 'ー' : 'ｰ', 'ㄱ' : 'ﾡ',
      \ 'ㄲ' : 'ﾢ', 'ㄳ' : 'ﾣ', 'ㄴ' : 'ﾤ', 'ㄵ' : 'ﾥ', 'ㄶ' : 'ﾦ', 'ㄷ' : 'ﾧ', 'ㄸ' : 'ﾨ', 'ㄹ' : 'ﾩ', 'ㄺ' : 'ﾪ', 'ㄻ' : 'ﾫ',
      \ 'ㄼ' : 'ﾬ', 'ㄽ' : 'ﾭ', 'ㄾ' : 'ﾮ', 'ㄿ' : 'ﾯ', 'ㅀ' : 'ﾰ', 'ㅁ' : 'ﾱ', 'ㅂ' : 'ﾲ', 'ㅃ' : 'ﾳ', 'ㅄ' : '', 'ㅅ' : 'ﾵ',
      \ 'ㅆ' : 'ﾶ', 'ㅇ' : 'ﾷ', 'ㅈ' : 'ﾸ', 'ㅉ' : 'ﾹ', 'ㅊ' : 'ﾺ', 'ㅋ' : 'ﾻ', 'ㅌ' : 'ﾼ', 'ㅍ' : 'ﾽ', 'ㅎ' : 'ﾾ', 'ㅏ' : 'ￂ',
      \ 'ㅐ' : 'ￃ', 'ㅑ' : 'ￄ', 'ㅒ' : 'ￅ', 'ㅓ' : 'ￆ', 'ㅔ' : 'ￇ', 'ㅕ' : 'ￊ', 'ㅖ' : 'ￋ', 'ㅗ' : 'ￌ', 'ㅘ' : 'ￍ', 'ㅙ' : 'ￎ',
      \ 'ㅚ' : 'ￏ', 'ㅛ' : 'ￒ', 'ㅜ' : 'ￓ', 'ㅝ' : 'ￔ', 'ㅞ' : 'ￕ', 'ㅟ' : 'ￖ', 'ㅠ' : 'ￗ', 'ㅡ' : 'ￚ', 'ㅢ' : 'ￛ', 'ㅣ' : 'ￜ',
      \ '！' : '!', '＂' : '"', '＃' : '#', '＄' : '$', '％' : '%', '＆' : '&', '＇' : "\'", '（' : '(', '）' : ')', '＊' : '*',
      \ '＋' : '+', '，' : ',', '－' : '-', '．' : '.', '／' : '/', '０' : '0', '１' : '1', '２' : '2', '３' : '3', '４' : '4',
      \ '５' : '5', '６' : '6', '７' : '7', '８' : '8', '９' : '9', '：' : ':', '；' : ';', '＜' : '<', '＝' : '=', '＞' : '>',
      \ '？' : '?', '＠' : '@', 'Ａ' : 'A', 'Ｂ' : 'B', 'Ｃ' : 'C', 'Ｄ' : 'D', 'Ｅ' : 'E', 'Ｆ' : 'F', 'Ｇ' : 'G', 'Ｈ' : 'H',
      \ 'Ｉ' : 'I', 'Ｊ' : 'J', 'Ｋ' : 'K', 'Ｌ' : 'L', 'Ｍ' : 'M', 'Ｎ' : 'N', 'Ｏ' : 'O', 'Ｐ' : 'P', 'Ｑ' : 'Q', 'Ｒ' : 'R',
      \ 'Ｓ' : 'S', 'Ｔ' : 'T', 'Ｕ' : 'U', 'Ｖ' : 'V', 'Ｗ' : 'W', 'Ｘ' : 'X', 'Ｙ' : 'Y', 'Ｚ' : 'Z', '［' : '[', '＼' : '\',
      \ '］' : ']', '＾' : '^', '＿' : '_', '｀' : '`', 'ａ' : 'a', 'ｂ' : 'b', 'ｃ' : 'c', 'ｄ' : 'd', 'ｅ' : 'e', 'ｆ' : 'f',
      \ 'ｇ' : 'g', 'ｈ' : 'h', 'ｉ' : 'i', 'ｊ' : 'j', 'ｋ' : 'k', 'ｌ' : 'l', 'ｍ' : 'm', 'ｎ' : 'n', 'ｏ' : 'o', 'ｐ' : 'p',
      \ 'ｑ' : 'q', 'ｒ' : 'r', 'ｓ' : 's', 'ｔ' : 't', 'ｕ' : 'u', 'ｖ' : 'v', 'ｗ' : 'w', 'ｘ' : 'x', 'ｙ' : 'y', 'ｚ' : 'z',
      \ '｛' : '{', '｜' : '|', '｝' : '}', '～' : '~', '｟' : '⦅', '｠' : '⦆', '￠' : '¢', '￡' : '£', '￢' : '¬', '￣' : '¯',
      \ '￤' : '¦', '￥' : '¥', '￦' : '₩',
      \ }
    let l:fullKeys = keys(l:mappings)
    let l:halfValues = values(l:mappings)

    let l:resultText = ''
    for l:char in split(a:text, '\zs')
        if a:widthType ==? 'fullWidth' && index(l:halfValues, l:char) != -1
            " Convert halfWidth to fullWidth
            let l:resultText .= l:fullKeys[index(l:halfValues, l:char)]
        elseif a:widthType ==? 'halfWidth' && index(l:fullKeys, l:char) != -1
            " Convert fullWidth to halfWidth
            let l:resultText .= l:mappings[l:char]
        elseif a:widthType ==? 'toggleWidth'
            " Auto toggle
            if index(l:fullKeys, l:char) != -1
                " Convert fullWidth to halfWidth
                let l:resultText .= l:mappings[l:char]
            elseif index(l:halfValues, l:char) != -1
                " Convert halfWidth to fullWidth
                let l:index = index(l:halfValues, l:char)
                let l:resultText .= l:fullKeys[l:index]
            else
                let l:resultText .= l:char
            endif
          else
              let l:resultText .= l:char
        endif
    endfor

    return l:resultText
endfunction
