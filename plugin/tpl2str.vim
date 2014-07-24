let s:path = getcwd()

function! s:Tpl2str(filename)

    let region = [getpos("'<")[1:2], getpos("'>")[1:2]]
    let lines = getline(region[0][0], region[1][0])

    let txt =  system('sh '.s:path.'/pattern/'.a:filename, join(lines,"\n"))

    call append(region[1][0], split(txt,'\n'))
    silent! exe "delete ".(region[1][0] - region[0][0]+1)

    echo getcwd()
endfunction

command! T2s :call <SID>Tpl2str("javascript-join.sh")

