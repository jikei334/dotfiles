vim.api.nvim_set_var('nvim_config_root', vim.fn.expand('<sfile>:p:h'))

require('environment')
require('autocmd')
require('plugin_manager')
require('visual')
require('diag')
require('mapping')
