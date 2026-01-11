CACHE = vim.env.HOME .. '/.cache'
dein_dir = CACHE .. '/dein/repos/github.com/Shougo/dein.vim'

toml_dir = vim.api.nvim_get_var('nvim_config_root') .. '/plugins/'
toml = toml_dir .. 'dein.toml'
lazy_toml = toml_dir .. 'dein_lazy.toml'
ddc_toml = toml_dir .. 'dein_ddc_lazy.toml'
ddu_toml = toml_dir .. 'dein_ddu_lazy.toml'
ft_toml = toml_dir .. 'dein_ft.toml'

path = vim.fn.expand(CACHE .. "/dein")

bin_dir = vim.env.HOME .. '/.local/bin'
if vim.fn.isdirectory(vim.fn.expand(bin_dir)) == 0 then
    vim.fn.mkdir(vim.fn.expand(bin_dir))
end

-- install dein
if vim.fn.isdirectory(vim.fn.expand(CACHE)) == 0 then
    vim.fn.mkdir(vim.fn.expand(CACHE))
end

if vim.o.runtimepath:match('/dein.nvim') == nil then
    vim.o.runtimepath = dein_dir .. ',' .. vim.o.runtimepath
end
if vim.fn.isdirectory(dein_dir) == 0 then
    vim.cmd("execute '!git clone https://github.com/Shougo/dein.vim " .. dein_dir .. "'")
end

local dein = require('dein')

-- config
dein.setup {
    install_progress_type = 'title',
    enable_notification = 1,
    install_log_filename = '~/dein.log',
}

-- load toml

if dein.load_state(path) == 1 then
    dein.begin(path, {
        vim.fn.expand('<sfile>'),
        toml,
        lazy_toml,
        ddc_toml,
        ddu_toml,
        ft_toml,
    })

    dein.load_toml(toml, {
        lazy = 0,
    })
    dein.load_toml(lazy_toml, {
        lazy = 1,
    })
    dein.load_toml(ddc_toml, {
        lazy = 1,
    })
    dein.load_toml(ddu_toml, {
        lazy = 1,
    })
    dein.load_toml(ft_toml)

    dein.end_()
    dein.save_state()

    if dein.check_install() then
        dein.install()
    end
end

