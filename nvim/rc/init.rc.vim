set encoding=utf-8

let &fileencodings = join([
    \ 'ucs-bom', 'iso-2022-jp-3', 'utf-8', 'euc-jp', 'cp932'
    \ ])

language message C

let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif

let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
    if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
        let s:dein_dir = expand('$CACHE/dein')
            \. '/repos/github.com/Shougo/dein.vim'
        if !isdirectory(s:dein_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif
    endif
    execute 'set runtimepath^=' .substitute(
        \ fnamemodify(s:dein_dir, ':p'), '/$', '', '')
endif
