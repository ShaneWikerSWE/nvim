" 2023-02-10
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-commentary' "Use gc to comment stuff
Plug 'lewis6991/impatient.nvim' "Speed up loading Lua modules in Neovim to improve startup time
Plug 'simnalamburt/vim-mundo' "Visualize the Vim undo tree
Plug 'tpope/vim-fugitive' "Vim plugin for Git
Plug 'ludovicchabant/vim-gutentags' "Tag plugin
Plug 'universal-ctags/ctags' "Tag program
Plug 'vimwiki/vimwiki/' "Personal wiki for Vim
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parenthesis, or quotes in pair
Plug 'neovim/nvim-lspconfig' "Configs for the Nvim LSP client
Plug 'williamboman/nvim-lsp-installer' "LSP installer (No longer maintened, replaced by mason.nvim)
Plug 'tpope/vim-surround' "Provides mappings to easily delete, change, and add surroundings in pairs
Plug 'nvim-lua/lsp-status.nvim' "Generates statusline components from the built-in LSP client
Plug 'inkarkat/vim-ingo-library' "Contains common autload functions used by other plugins
Plug 'inkarkat/vim-SpellCheck' "Populated quickfix-list with all spelling errors found
Plug 'nvim-treesitter/nvim-treesitter' "Provides syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter-refactor' "Refactor modules for nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects' "Syntax aware text-objects
Plug 'preservim/nerdtree' "File system explorer for Vim editor
Plug 'hrsh7th/nvim-cmp' "A completion engine plugin for neovim written in Lua
Plug 'hrsh7th/cmp-buffer' "nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-path' "nvim-cmp source for filesystem paths
Plug 'hrsh7th/cmp-cmdline' "nvim-cmp source fo rvim's cmdline
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in language server client
Plug 'saadparwaiz1/cmp_luasnip' "Luasnip completion source for nvim-cmp
Plug 'akinsho/toggleterm.nvim' "Persists and toggles terminals
Plug 'jparise/vim-graphql' "Provides GraphQL file detection, syntax highlighting, and indentation
Plug 'ahmedkhalf/project.nvim' "Automatically cd to project directory using nvim LSP
Plug 'jremmen/vim-ripgrep' "Use RipGrep in Vim to display results in a quickfix list
Plug 'unblevable/quick-scope' "Highlights first occurence of character to the right of cursor
Plug 'L3MON4D3/LuaSnip' "Snippet engine
Plug 'ryanoasis/vim-devicons' "Adds filetype glyphs to various vim plugins
Plug 'ton/vim-bufsurf' "Enabled surfing through buffers based on viewing history per window
Plug 'wellle/targets.vim' "Adds various text objects
Plug 'nvim-lua/plenary.nvim' "All the lua functions he doesn't want to write twice
Plug 'kyazdani42/nvim-web-devicons' "Lua fork of devicons
Plug 'kana/vim-textobj-user' "Create your own text objects
Plug 'Julian/vim-textobj-variable-segment' "Provides a single text object for variable segments
Plug 'romainl/vim-cool' "Disabled search highlighting when done searching
Plug 'mfussenegger/nvim-dap' "Debug adapter protocol
Plug 'rcarriga/nvim-dap-ui' "A UI for nvim-dap
Plug 'karb94/neoscroll.nvim' "Smooth scrolling
Plug 'weilbith/nvim-code-action-menu' "Pop-up menu for code actions
Plug 'windwp/nvim-ts-autotag' "Use treesitter to auto close and auto rename html tag
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } "Highly extendable fuzzy finder
Plug 'benfowler/telescope-luasnip.nvim' "Adds LuaSnip snippet picker to Telescope
Plug 'nvim-telescope/telescope-file-browser.nvim' "File browser extension for Telescope
Plug 'nvim-lualine/lualine.nvim' "A Neovim statusline plugin
Plug 'ruifm/gitlinker.nvim' "Generate GitHub link from selected code
Plug 'christoomey/vim-tmux-navigator' "tmux navigation
Plug 'kevinhwang91/nvim-bqf' "Quickfix replace
Plug 'tpope/vim-abolish' "Change camelCase, snake_case, etc
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'airblade/vim-rooter'
Plug 'mattn/calendar-vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jackMort/ChatGPT.nvim'

  " Disable netrw gx mapping.
  let g:netrw_nogx = get(g:, 'netrw_nogx', 1)
  nmap gx <Plug>(openbrowser-open)
  vmap gx <Plug>(openbrowser-open)
"}

"Themes
Plug 'catppuccin/nvim'
call plug#end()

set vb t_vb=
set noswapfile
set noreadonly
" setlocal fo+=aw "Avoid line breaks in email
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=50
set clipboard+=unnamedplus
set nowrap
set tw=0

"set background=dark
"set t_Co=256

hi TabLine    gui=NONE guibg=#000000 guifg=#abb2bf    cterm=NONE term=NONE ctermfg=black ctermbg=white

autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 1000)
autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 1000)
autocmd FileChangedRO * echohl WarningMsg | echo "" | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "" | echohl None
autocmd QuickFixCmdPost *grep* cwindow

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=White guibg=Purple gui=underline ctermfg=White cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=White guibg=Purple gui=underline ctermfg=White cterm=underline
augroup END

let loaded_spellfile_plugin = 1

if hostname() == 'LAPTOP-5C92PE9G'
let g:vimwiki_list = [{'path': 'C:/Users/ELLE/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki' }]
endif
if hostname() == 'amethyst'
let g:vimwiki_list = [{'path': '~/Dropbox/Vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'index': 'Wiki' }]
endif

let g:NERDTreeShowHidden = 1

if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

lua require('config')
lua require('luasnips_config')
lua require('keymaps')
lua require('options')

nnoremap p "+p

if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif

"Seach and replace
nnoremap <Leader>rr :%s/\<<C-r><C-w>\>//g<Left><Left>

:au VimEnter * :GitGutterDisable
