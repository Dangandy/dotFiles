" Plugins {{{
call plug#begin()
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
call plug#end()
" }}}

" Settings {{{
colorscheme monokai
filetype plugin indent on
syntax on
set spelllang=en,cjk  " spellcheck
set autoindent
set modelines=0
set encoding=utf-8
set scrolloff=3                 " cursor will always be 3 lines above the bottom
set wildmenu
set wildignorecase                  "Case-insensitive completions
set wildmode=list:longest,full      "Show list of completions
set noswapfile
set wrap                            " Wrap lines
set termguicolors
set ignorecase
set incsearch                       " go to the searched word
set smartcase
set list
set listchars=tab:▸\ ,eol:¬,trail:·,extends:⟩,precedes:⟨
set cursorline                      " show current line
set showcmd
set colorcolumn=88
" Better highlighting {{{
set number relativenumber
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number relativenumber
    autocmd WinLeave * set norelativenumber nonumber
augroup END
" }}}

" Jump to last position on open file {{{
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" }}}
" }}}

" Autocmd {{{
autocmd FocusLost * :silent! wall    " Save when losing focus
" FILE SPECIFIC AUTOCMD {{{
    " HTML {{{
    augroup filetype_html
        autocmd!
        autocmd BufNewFile,BufRead *.html setlocal nowrap
        " reindent entire file
        autocmd BufWritePre,BufRead *.html :normal gg=G
    augroup END
    " }}}

    " VIM {{{
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END
    " }}}

    " JS {{{
    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=manual
        au FileType javascript set tabstop=2
        au FileType javascript set softtabstop=2
        au FileType javascript set shiftwidth=2
        au FileType javascript set expandtab
        au BufWinLeave *.js mkview
        au BufWinEnter *.js silent! loadview
    augroup END
    " }}}

    " Python {{{
    augroup filetype_python
        autocmd!
        autocmd BufNewFile *.py -1read /Users/drew/.vim/skeletons/skeleton.py
        autocmd FileType Python setlocal foldmethod=manual
        autocmd FileType python set tabstop=4
        autocmd FileType python set softtabstop=4
        autocmd FileType python set shiftwidth=4
        autocmd FileType python set expandtab
        au BufWinLeave *.py mkview
        au BufWinEnter *.py silent! loadview
    augroup END
    " }}}
" }}}
"}}}

" python stuff
let g:python_host_prog = '/Users/drew/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/drew/.pyenv/versions/neovim3/bin/python'

" COC {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

" Neovim is slow when I press escape
set nottimeout

" Keybindings {{{

    " Leader key is space
    let mapleader = "\<space>"
    let maplocalleader = "\<space>"

    " ABBREVIATION
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
    iabbrev moedel model
    iabbrev deraths deaths
    iabbrev deafths deaths
    iabbrev dewfath deaths
    iabbrev defath death
    iabbrev resouces resources
    iabbrev Resouces Resources

    " Shortcuts
    
    " edit & source .vimrc
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>eu :vsplit<cr>:CocCommand snippets.editSnippets<cr>
    nnoremap <leader>sp :set spell!<cr>

    nnoremap ; :
    inoremap 9) ()
    nnoremap "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<cr>
    inoremap f' f''<esc>i
" }}}

" FZF <3 {{{
set rtp+=/usr/local/opt/fzf
nmap <Leader>/ :Rg<Space>
nmap <Leader>f :Files<CR>
" }}}

" coc-snippets {{{
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 
" }}}

" coc-prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" }}}

" TagBar {{{
nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>
" }}}
