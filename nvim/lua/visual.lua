local options = {
    number = true,
    ruler = true,
    cursorline = true,
    list = true,
    autoindent = true,
    smartindent = true,

    tabstop = 4,
    softtabstop = 0,
    shiftwidth = 4,
    expandtab = true,

    laststatus = 2,

    modeline = true,
    modelines = 10,

    title = true,
    titleold = "Terminal",
    titlestring = "%F",

    statusline = '%F%m%r%h%w%=(%{&ff}/%Y)\\ (line\\ %l\\/%L.\\ col\\ %c)\\',
}

vim.cmd("colorscheme molokai")

for k, v in pairs(options) do
    vim.opt[k] = v
end


-- airline
vim.g.airline_theme = 'powerlineish'
vim.g['airline#extensions#syntastic#enabled'] = 1
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tagbar#enabled'] = 1
vim.g['airline_skip_empty_sections'] = 1

-- whitespace
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ws",
    callback = function(args)
        local ws_option = {
            autoindent = false,
            smartindent = false,
            expandtab = false,
        }
        for k, v in pairs(ws_option) do
            vim.opt[k] = v
        end
    end
})
