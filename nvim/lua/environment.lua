if vim.o.compatible then
    vim.opt["nocompatible"] = true
end

local options = {
    writebackup = false,
    backup = false,
    swapfile = false,

    ignorecase = true,
    smartcase = true,
    wrapscan = true,
    incsearch = true,
    inccommand = "split",

    mouse = "",

    clipboard = "unnamedplus"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- python
if vim.fn.has('wsl') == 1 then
    vim.g.python3_host_prog = vim.fn.exepath('python3')
elseif vim.fn.has('Windows') == 1 then
    vim.g.python3_host_prog = vim.fn.exepath('python')
else
    vim.g.python3_host_prog = vim.fn.exepath('python3')
end

-- terminal
local shell = vim.env.SHELL
if shell == nil then
    if vim.fn.executable('zsh') == 1 then
        vim.opt.shell = "zsh"
        vim.opt.shellcmdflag = "-lc"
    elseif vim.fn.executable('bash') == 1 then
        vim.opt.shell = "bash"
        vim.opt.shellcmdflag = "-lc"
    end
else
    if vim.fn.executable(shell) == 1 then
        vim.opt.shell = shell
        vim.opt.shellcmdflag = "-lc"
    end
end

-- clip board
local function paste()
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
        ['+'] = paste,
        ['*'] = paste,
    },
}
