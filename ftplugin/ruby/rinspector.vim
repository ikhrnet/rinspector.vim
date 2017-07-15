" Author:  Tatsuya Ikehara
" Version: 0.1
" License: MIT License

if exists('g:loaded_rinspector')
  finish
endif
let g:loaded_rinspector = 1

let s:save_cpo = &cpo
set cpo&vim

function! g:rinspector#toggle(method)
    if getline('.') =~ '^$'  " Do nothing against empty lines
        return
    endif
    let l:pos = getpos('.')
    if getline('.') =~ '^\s*p\s'  " 'p ' -> ''
        let l:indentation = matchstr(getline('.'), '^\s*')
        call setline(line('.'), l:indentation . getline('.')[strlen(indentation) + 2:])
        let l:pos[2] -= 2
        if a:method == 'puts'  " 'p ' -> 'puts '
            execute ':normal I' . 'puts '
            let l:pos[2] += 5
        endif
    elseif getline('.') =~ '^\s*puts\s'  " 'puts ' -> 'p '
        if a:method == 'p'
            let l:indentation = matchstr(getline('.'), '^\s*')
            call setline(line('.'), l:indentation . getline('.')[strlen(l:indentation) + 5:])
            let l:pos[2] -= 3  " 'p ' is 3 characters shorter than 'puts ' 
            call rinspector#toggle('p')
        endif
    else  " '' -> 'p '
        if a:method == 'p'
            execute ':normal I' . 'p '
            let l:pos[2] += 2
        endif
    endif
    call setpos('.', l:pos)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

