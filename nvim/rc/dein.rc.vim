let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#install_log_filename = '~/dein.log'

let s:path = expand('$CACHE/dein')
if !dein#load_state(s:path)
    finish
endif

let s:dein_toml_dir = g:nvim_config_root . "/plugins/"
let s:dein_toml = s:dein_toml_dir . "dein.toml"
let s:dein_lazy_toml = s:dein_toml_dir . "dein_lazy.toml"
let s:dein_ft_toml = s:dein_toml_dir . "dein_ft.toml"

call dein#begin(s:path, [
    \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml
    \ ])

call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
call dein#load_toml(s:dein_ft_toml)

call dein#end()
call dein#save_state()

if dein#check_install()
    call dein#install()
endif
