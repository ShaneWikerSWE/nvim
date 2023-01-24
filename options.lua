local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.tags = './tags,/tags'
opt.autoread = true
opt.linebreak = true
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
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.undodir = '~/.vim/undo'
opt.bg = 'dark'
--opt.termguicolors = true
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
sign define DiagnosticSignHint text=💡 linehl= texthl=DiagnosticSignHint numhl=
]]


vim.cmd [[highlight Search ctermbg=Yellow guibg=White ctermfg=Green guifg=Purple]]
vim.cmd [[highlight IncSearch ctermbg=Yellow guibg=White ctermfg=Green guifg=Purple]]
--hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
--hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
--hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
--hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
--hi IncSearch cterm=NONE ctermfg=yellow ctermbg=green
--hi Search cterm=NONE ctermfg=blue ctermbg=red

g['ncsearch#auto-nohlsearch'] = 1
g['gutentags_enabled'] = 1
g['vimwiki_global_ext'] = 0
g['vimwiki_conceallevel'] = 1
g['vimwiki_folding'] = 'custom'
g['vimwiki_url_maxsave'] = 0
g['qs_highlight_on_keys'] = { 'f', 'F', 't', 'T' }
g['markdown_folding'] = 1
g['peekup_open'] = '<leader>"'
g['rg_derive_root'] = true
