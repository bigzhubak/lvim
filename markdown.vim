" markdown wiki --------------------------------------------------------------------------------------------------------------

" 文章内容存储目录
let g:md_path='~/Dropbox/cheese/tips/'
" 设置文件类型
let g:vimwiki_filetypes = ['markdown', 'pandoc']
let g:vimwiki_list = [{'path': g:md_path,
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" transfor markmap
map <F4> :cd %:h <cr> :!markmap_new "%:t" -o ../mindmap/"%:r.html"<cr>

map <c-f> :SearchMD 
" 关了 folding
let g:vim_markdown_folding_disabled = 1

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
