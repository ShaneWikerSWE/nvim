local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.tags = './tags,/tags'
opt.autoread = true
opt.number = true
opt.showbreak = '+++'
opt.showmatch = true
opt.visualbell = true
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.tabstop = 4
opt.autoindent = true
opt.shiftwidth = 4
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.autochdir = true
opt.ruler = true
opt.undolevels = 3000
opt.fileencoding = 'utf8'
opt.encoding = 'UTF-8'
opt.syntax = 'on'
opt.undofile = true
opt.undodir = '~/.vim/undo'
opt.bg = 'dark'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.autowriteall = true
opt.guifont = 'Hack:h12'
opt.ma = true

cmd [[colorscheme catppuccin-macchiato]]
cmd [[
sign define DiagnosticSignError text= linehl= texthl=DiagnosticSignError numhl=
sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
sign define DiagnosticSignInfo text= linehl= texthl=DiagnosticSignInfo numhl=
sign define DiagnosticSignHint text= linehl= texthl=DiagnosticSignHint numhl=
]]

vim.cmd [[highlight Search ctermbg=Yellow guibg=White ctermfg=Green guifg=Purple]]
vim.cmd [[highlight IncSearch ctermbg=Yellow guibg=White ctermfg=Green guifg=Purple]]

g['ncsearch#auto-nohlsearch'] = 1
g['gutentags_enabled'] = 1
g['vimwiki_global_ext'] = 0
g['vimwiki_conceallevel'] = 1
g['vimwiki_folding'] = 'custom'
g['vimwiki_url_maxsave'] = 0
g['vimwiki_list'] = { { path = '~/.config/Vimwiki', syntax = 'markdown', ext = '.md' } }
g['qs_highlight_on_keys'] = { 'f', 'F', 't', 'T' }
g['markdown_folding'] = 1
g['peekup_open'] = '<leader>"'
g['rg_derive_root'] = true
g['session_autoload'] = 'no'
g['netrw_keepdir'] = 0 --Keep directory synced
g['netrw_winsize'] = 0 --Change size of directory window
g['netrw_banner'] = 0 --Show or hide directory banner
g['netrw_localcopydircmd'] = 'cp -r' --Enable or disable recursive copy of directories
