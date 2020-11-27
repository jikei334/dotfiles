" no backup
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

" search
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

let g:python3_host_prog = substitute(system('which python3'), "\n", "", "")
let g:python2_host_prog = substitute(system('which python2'), "\n", "", "")
