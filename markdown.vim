" 文章内容存储目录
let g:md_path='~/cheese/'

"找 md 
if exists("*SearchMD")
else
    function! SearchMD(Name)
        "保证基础路径
        execute "cd ".g:md_path
        "首先要设置运行路径,避免路径不同
        execute "silent !markdown_search.py '".g:md_path."' '".a:Name."'"
        execute ":redraw!"
        execute "edit! index.md"
    endfunction
endif
command! -nargs=1 SearchMD call SearchMD("<args>")
