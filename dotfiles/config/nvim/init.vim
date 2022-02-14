call plug#begin('~/.config/nvim/plugins')

Plug 'itchyny/lightline.vim'
Plug 'mboughaba/i3config.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'reedes/vim-pencil'
Plug 'vim-scripts/TagHighlight'

call plug#end()

colorscheme dracula

set number
set mouse=a
set ignorecase
set noshowmode
set clipboard+=unnamedplus
set fcs=eob:\ 
set scrolloff=2
set sidescrolloff=2
set nowrap
set sidescroll=1

set tabstop=4
set shiftwidth=4
set expandtab

map <C-left> 10zh
map <C-right> 10zl

map <Space> <Leader>

nnoremap <silent> <CR> :nohlsearch<CR><CR>
nnoremap ; :

" auto close special characters
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" ================================================================

" ==========
" indentLine
" ==========

let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['text', 'startify', 'tex', 'md']

" ================================================================

" =========
" lightline
" =========
"
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'active': {
	\   'right': [ [ 'filetype' ] ]
	\ },
	"\ 'separator': { 'left': '', 'right': '' },
	"\ 'subseparator': { 'left': '', 'right': '' }	
	\ }

" ================================================================

" ========
" startify
" ========

let g:startify_lists = [
    \ {'type': 'bookmarks',     'header': ['dotfiles']}
    \ ]

let g:startify_bookmarks = [
    \ '~/.zshrc',
    \ '~/.Xdefaults',
    \ '~/.config/i3/config',
    \ '~/.config/polybar/config',
    \ '~/.config/polybar/modules',
    \ '~/.config/nvim/init.vim',
    \ '~/.config/ranger/rc.conf',
    \ ]

let g:startify_enable_special = 0

" start indexing at 1 instead of 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" center the ascii art
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

let g:startify_fortune_use_unicode = 1

" ================================================================

" ========
" coc.nvim
" ========

" for coc-ltex
let g:coc_filetype_map = {'tex': 'latex'}

" use ctrl+space for trigger completion and navigate to the next complete item
inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" ================================================================

" =========
" ultisnips
" =========

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" ================================================================

" ======
" vimtex
" ======

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

" for minted, comment it out after being done with minted
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

" ================================================================

" ==============
" vim-commentary 
" ==============

autocmd FileType c,cpp,cs,java,arduino setlocal commentstring=//\ %s
autocmd FileType matlab setlocal commentstring=%\ %s

" ================================================================

" ==========
" vim-pencil 
" ==========

" auto run
set nocompatible
filetype plugin on

augroup pencil
  autocmd!
  autocmd FileType tex         call pencil#init({'wrap': 'soft'})
augroup END

let g:pencil#conceallevel = 0
