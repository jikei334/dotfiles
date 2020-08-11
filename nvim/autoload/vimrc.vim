function! vimrc#on_filetype() abort
    if executable('filetype') =~# 'OFF'
        " Lazy loading
        silent! filetype plugin indent on
        syntax enable
        filetype detect
    endif
endfunction
