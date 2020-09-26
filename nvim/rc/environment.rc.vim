" no backup
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

let g:python3_host_prog = substitute(system('which python3'), "\n", "", "")
