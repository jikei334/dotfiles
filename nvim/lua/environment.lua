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

vim.g.python3_host_prog = vim.fn.exepath('python3')

-- clip board
if vim.fn.has('Windows') then
    local win32yank_path = os.getenv("HOME") .. "/.local/bin/win32yank.exe"
    if vim.fn.getftype(win32yank_path) == "" then
        local win32yank_url = 'https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x86.zip'
        local temp_dir = vim.fn.tempname()
        vim.fn.mkdir(temp_dir)
        vim.cmd("execute '!wget -P " .. temp_dir .. " " .. win32yank_url .. "'")
        vim.cmd("execute '!unzip -d " .. temp_dir .. " " .. temp_dir .. "/win32yank-x86.zip'")
        vim.cmd("execute '!cp " .. temp_dir .. "/win32yank.exe " .. win32yank_path .. "'")
        vim.cmd("execute '!chmod +x " .. win32yank_path .. "'")
    end
    vim.g.clipboard = {
        name = 'myClipboard',
        copy = {
            ["+"] = "win32yank.exe -i",
            ["*"] = "win32yank.exe -i",
        },
        paste = {
            ["+"] = "win32yank.exe -o",
            ["*"] = "win32yank.exe -o",
        },
        cache_enabled = 1,
    }
end
