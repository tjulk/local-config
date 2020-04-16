set clipboard+=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set enc=utf-8
set termencoding=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set scrolloff=3

set number
set showmatch
set smarttab
set smartindent
set autoindent
set incsearch
set ignorecase
"set hlsearch
set smartcase
set cursorline
set completeopt-=preview
set splitbelow
set cmdheight=2
set hidden
" set guicursor=i-ci:ver30-iCursor ""-blinkwait300-blinkon200-blinkoff150
" set guicursor+=n-v-c:block-nvcCursor ""-blinkwait300-blinkon200-blinkoff150
set mouse=a
set fdm=manual
syntax on
filetype plugin on
filetype indent on

let mapleader=" "

:autocmd InsertEnter,InsertLeave * set cul!

au FileType proto set expandtab
au FileType proto set shiftwidth=4
au FileType proto set softtabstop=4
au FileType proto set tabstop=4
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

vnoremap p "_dP

" close quick fix window by esc
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" vim-plug begin"
call plug#begin('~/.local/share/nvim/plugged')

" dracula "
Plug 'dracula/vim'

" vim-css-color
Plug 'ap/vim-css-color'

" vim-diminactive
Plug 'blueyed/vim-diminactive'
Plug 'tmux-plugins/vim-tmux-focus-events'
let g:diminactive_enable_focus = 1
let g:diminactive_buftype_blacklist = []

let g:go_version_warning = 0

" vim-surround
Plug 'tpope/vim-surround'

" incsearch
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" terminus
Plug 'wincent/terminus'

" ALE "
Plug 'w0rp/ale'
let g:ale_enable = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_enter = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'go': ['gobuild']}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" AirLine "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" super tab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

" expand-region
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>

"fzf"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

"gitgutter"
Plug 'airblade/vim-gitgutter'

" gitv "
Plug 'gregsexton/gitv'

" fugitive "
Plug 'tpope/vim-fugitive'

" oscyank
Plug 'greymd/oscyank.vim'
noremap <leader>y :Oscyank<cr>

"nerdtree"
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <Leader>o :NERDTreeTabsToggle<CR>

nnoremap <Leader>j :NERDTreeFocusToggle<CR>
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

"vim-go"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_guru_scope = ["vendor/...", "."]
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1


" deoplete "
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt+=noinsert

Plug 'tbodt/deoplete-tabnine', {'do': './install.sh'}

" ack "
Plug 'mileszs/ack.vim'
noremap <C-g> :Ack! <cword> $GOPATH<cr>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" gundo
Plug 'sjl/gundo.vim'
nnoremap <Leader>h :GundoToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
	set undolevels=1000
	set undoreload=10000
endif

" vim-multiple-cursors "
Plug 'terryma/vim-multiple-cursors'

" tagbar "
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>

" umimpaired "
Plug 'tpope/vim-unimpaired'

" tmuxline
Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

" visincr
Plug 'vim-scripts/visincr'

" delimitmate
Plug 'raimondi/delimitmate'
let delimitMate_expand_cr=1

" commentary "
Plug 'tpope/vim-commentary'
noremap <leader>/ :Commentary<cr>
Plug 'https://github.com/vim-scripts/fcitx.vim.git'

" vim-plug end"
call plug#end()

color dracula

hi comment ctermfg=6
