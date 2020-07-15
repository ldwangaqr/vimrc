set nocompatible              " be iMproved, required
filetype off                  " required
 	
call plug#begin()
Plug 'fatih/vim-go'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'majutsushi/tagbar'
Plug 'tomasiser/vim-code-dark'
map <F4> :CocSearch<CR>
map <F6> :TagbarToggle<CR>
" NerdTree 配置
  map <F8> :NERDTreeToggle<CR>

  let NERDTreeIgnore=['\.o$','\.a$', '\.pyc$', '\.taghl$','\~$', 'cscope\.', 'tags$', '\.bak$', '\.php\~$']
  let NERDTreeChDirMode = 2
  let NERDTreeWinSize = 20
  let NERDTreeShowBookmarks = 1
" All of your Plugins must be added before the following line
call Plug#end()            " required
filetype plugin indent on    " required

" coc.nvim settings
" ---

" Don't load the defx-git plugin file, not needed
let b:defx_git_loaded = 1

" Use <Tab> for trigger completion and navigate to the next complete item
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() :
	\ delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

augroup user_plugin_coc
	autocmd!
	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap gs <Plug>(coc-git-chunkinfo)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show commit contains current position
nmap gC <Plug>(coc-git-commit)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		let l:found = CocAction('doHover')
	endif
endfunction

set nu

set noerrorbells

set incsearch

setlocal noswapfile

set bufhidden=hide

set fenc=utf-8

set shortmess=atI

let &t_SI = "\<Esc>]50;CursorShape=1\x7"

let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax enable
set hlsearch

set t_Co=256
colorscheme OceanicNext
set background=dark
set cursorline
set nocompatible
set backspace=indent,eol,start
set guifont=JetBrainsMono-ExtraBold\ 20
set shortmess=atI
