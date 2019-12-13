" Pathogen {{{
filetype off
call pathogen#infect()
syntax on
set autoindent
filetype plugin indent on
set modelines=0
" }}}

" TABBING {{{
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}

" Basic Stuff  {{{
set ttyfast
set encoding=utf-8
set scrolloff=3   " cursor will always be 3 lines above the bottom
" set foldcolumn=1
set mouse=a		    " Enable Mouse
set title           "Show filename in titlebar of window
" set cursorline
set wildmenu
set wildignorecase                  "Case-insensitive completions
set wildmode=list:longest,full      "Show list of completions
" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=500 ttimeoutlen=500
" }}}

" Better highlighting {{{
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number relativenumber
    autocmd WinLeave * set norelativenumber nonumber
augroup END
" }}}

" On save action {{{
" Return to last edit position when opening files (You want this!) {{{
" 1st line is if file has lines in it
" execute code in normal mode
"   vim automagically saves your previous point in special markers:
"   - ": position you saved from
"   - ': position you jumped from
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" }}}
autocmd FocusLost * :silent! wall    " Save when losing focus
set noswapfile
" }}}

" Column UI {{{
set wrap 		      " Wrap lines
set ruler
" }}}

" color scheme
colorscheme seoul256

" SEARCHING {{{
set ignorecase
set incsearch		" go to the searched word
set smartcase
"}}}

" More aesthetic
set formatoptions=tcqn1
set list
set listchars=tab:▸\ ,eol:¬
set cursorline

" Leader key is space
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" NerdTree{{{
inoremap <leader>k <esc>:NERDTreeToggle<cr>
nnoremap <leader>k :NERDTreeToggle<cr>
"}}}

" ALE {{{
let g:ale_fixers = {
    \ 'python': ['remove_trailing_lines', 'trim_whitespace','black', 'reorder-python-imports']
    \ }
let g:ale_fix_on_save = 1
" }}}

" YCM & SuperTab & Ultisnip{{{

" YCM
let g:ycm_use_clangd = 0
let g:ycm_python_binary_path = '/Users/drew/anaconda3/bin/python3'
let g:ycm_server_keep_logfiles = 1

" Bindings {{{
"   make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

"   better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"   }}}

" Ultisnip {{{
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories= ["~/Desktop/dotFiles/vim/Ultisnips"]
" }}}
" }}}

" remaps
inoremap ii <ESC>
nnoremap ; :
inoremap 9) ()
inoremap """ """<esc>o"""<esc>O
nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<cr>

" edit & source .vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eu :UltiSnipsEdit<cr>
" }}}

" USE za to unwrap the codes!!
" FILE SPECIFIC AUTOCMD {{{
" HTML {{{
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    autocmd BufWritePre,BufRead *.html :normal gg=G
augroup END
" }}}

" VIM {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Python {{{
augroup filetype_python
    autocmd!
    autocmd BufWritePre *.py set textwidth=88
    autocmd FileType python setlocal foldmethod=indent
augroup END
" }}}
" }}}

" ABBREVIATION {{{
iabbrev adn and
iabbrev @@ mail@andydang.ca
cabbrev help vert help
iabbrev letf left
iabbrev gihtub github
iabbrev cvs csv
iabbrev funtion function
cabbrev *** **/*
iabbrev scv csv
iabbrev retrun return
iabbrev trian train
" }}}

" highlight column when it passes 88 - black says 88 is better than 80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%89v', 100)

