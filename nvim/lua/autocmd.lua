local MyAutoCmd = vim.api.nvim_create_augroup('MyAutoCmd', {
    clear = true,
})
vim.api.nvim_create_autocmd({
    'Filetype',
    'Syntax',
    'BufNewFile',
    'BufNew',
    'BufRead'
}, {
    pattern = '*?',
    group = MyAutoCmd,
    command = 'call vimrc#on_filetype()',
})
vim.api.nvim_create_autocmd({
    'CursorHold',
}, {
    pattern = '*.toml',
    group = MyAutoCmd,
    command = 'syntax sync minlines=300',
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescriptreact",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.expandtab = true
    end
})

local filetypedetect = vim.api.nvim_create_augroup('filetypedetect', {})
