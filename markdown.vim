" markdown wiki --------------------------------------------------------------------------------------------------------------

" 文章内容存储目录
let g:md_path='~/Dropbox/cheese/'
"hugo 模版和配置文件目录
let g:blog_source_dir='~/Dropbox/blog/'
let g:sub_path='tips/'

let g:vimwiki_list = [{'path': g:md_path.g:sub_path,
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" transfor markmap
map <F4> :cd %:h <cr> :!markmap_new "%:t" -o ../mindmap/"%:r.html"<cr>

map <c-f> :SearchMD 
" 用这一行来跳转文件(search 时用)
nmap <c-g> 0v$<esc>:execute "CreateOrOpenMD ".getline('.').".md"<cr>
" 取到v 下选中的值, 再用 open 打开
" 选中认为不包含路径, 默认指向 /tips
vmap <c-g> <c-">ay: execute "CreateOrOpenMD ".g:sub_path."/<c-r>a.md"<cr>
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
        execute "edit! search.md"
    endfunction
endif
command! -nargs=1 SearchMD call SearchMD("<args>")

"生成 markdow 文件
if exists("*CreateOrOpenMD")
else
    function! CreateOrOpenMD(FileName)
      let g:path_file=g:md_path.a:FileName
      "文件不存在就用 hugo 创建并且替换参数
      if empty(glob(g:path_file))
        echo "silent ! hugo new '".a:FileName."'"
        execute "silent ! hugo -s ".g:blog_source_dir." new '".a:FileName."'"
        execute "e ".g:path_file
      else
        "存在直接编辑
        execute "e ".g:path_file
      endif
    endfunction
endif
command! -nargs=1 CreateOrOpenMD call CreateOrOpenMD("<args>")
