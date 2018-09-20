
call plug#begin('~/.local/share/nvim/plugged')

" Required
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-speeddating'

" Visuals
" Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'

" Navigating Project Files
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mhinz/vim-grepper'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }

  " Git support
  Plug 'tpope/vim-fugitive'

  " Code Editing
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'w0rp/ale'
  Plug 'tpope/vim-surround'

  " GoLang
  Plug 'fatih/vim-go'

  " Movement
  Plug 'justinmk/vim-sneak'

  " Tmux
  Plug 'christoomey/vim-tmux-navigator'

  " Org mode
  Plug 'jceb/vim-orgmode'

  call plug#end()

  """"""""""""""""""""""
  "      Settings      "
  """"""""""""""""""""""
  set nomodeline
  set nocompatible                        " Enables us Vim specific features
  filetype off                            " Reset filetype detection first ...
  filetype plugin indent on               " ... and enable filetype detection
  set ttyfast                             " Indicate fast terminal conn for faster redraw
  set laststatus=2                        " Show status line always
  set encoding=utf-8                      " Set default encoding to UTF-8
  set autoread                            " Automatically read changed files
  set autoindent                          " Enabile Autoindent
  set backspace=indent,eol,start          " Makes backspace key more powerful.
  set incsearch                           " Shows the match while typing
  set hlsearch                            " Highlight found searches
  set noerrorbells                        " No beeps
  set conceallevel=1
  set number                              " Show line numbers
  set relativenumber
  set showcmd                             " Show me what I'm typing
  set noswapfile                          " Don't use swapfile
  set nobackup                            " Don't create annoying backup files
  set splitright                          " Vertical windows should be split to right
  set encoding=utf8
  set nowrap                              " Stop word wrapping
  autocmd FileType markdown setlocal wrap " Except... on Markdown.
  set undolevels=100                      " Adjust system undo levels
  set scrolloff=1                         " Space above cursor from screen edges
  set sidescrolloff=5                     " Space beside cursor from screen edges
  set mouse=r                             " Disable mouse support
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  "set tabstop=2                           " Set tab width and convert tabs to spaces
  "set softtabstop=2
  "set shiftwidth=2
  "set expandtab

  " Enable to copy to clipboard for operations like yank, delete, change and put
  " http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
  if has('unnamedplus')
    set clipboard^=unnamed
    set clipboard^=unnamedplus
  endif

  " This enables us to undo files even if you exit Vim.
  if has('persistent_undo')
    set undofile
    set undodir=~/.config/vim/tmp/undo//
  endif

  """"""""""""""""""""""
  "      Mappings      "
  """"""""""""""""""""""

  " Set leader shortcut to a comma ','. By default it's the backslash
  let mapleader = ","

  " Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
  " quickfix window with <leader>a
  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>
  nnoremap <leader>a :cclose<CR>

  " Visual linewise up and down by default (and use gj gk to go quicker)
  noremap <Up> gk
  noremap <Down> gj
  noremap j gj
  noremap k gk

  " Search mappings: These will make it so that going to the next one in a
  " search will center on the line it's found in.
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Act like D and C
  nnoremap Y y$

  " Enter automatically into the files directory
  autocmd BufEnter * silent! lcd %:p:h

  " Theme
  " set background=dark
  " colorscheme solarized
  color dracula

  " vim-airline
  let g:airline#extensions#tabline#enabled=1
  let g:airline_powerline_fonts=0
  set laststatus=2

  " indentLine
  let g:indentLine_enabled = 1
  let g:indentLine_char = "⟩"

  " Return to last opened file
  nmap <Leader><Leader> <c-^>

  " adding empty lines
  nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
  nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

  " moving current line
  nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
  nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>

  " arrow keys resize pane
  "nnoremap <Left> :vertical resize -1<CR>
  "nnoremap <Right> :vertical resize +1<CR>
  "nnoremap <Up> :resize -1<CR>
  "nnoremap <Down> :resize +1<CR>

  " Grepper
  nnoremap <Leader>fp :Grepper<Space>-query<Space>
  nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" File Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" vimfiler
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  set autowrite
  let g:go_auto_sameids = 1
  let g:go_auto_type_info = 1
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
