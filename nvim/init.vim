let g:nvim_config_root = expand('<sfile>:p:h')

execute 'source' fnamemodify(expand('<sfile>'), ':h') .'/rc/vimrc'
