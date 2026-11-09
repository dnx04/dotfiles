-- Shared LazyVim options for desktop and server.
vim.opt.shell = "/usr/bin/fish"
vim.opt.relativenumber = true

vim.g.autoformat = false
vim.g.lazyvim_python_lsp = "pyrefly"
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_explorer = "snacks"

require("config.remote_clipboard").setup()
