" ==========================================
" Author:   Cody Karunas
" Filename: .vimrc
" ==========================================

" ==========================================
" Vim-plug
" ==========================================
call plug#begin()
" Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
" Plug 'w0rp/ale'
" Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'docunext/closetag.vim'
Plug 'raimondi/delimitmate'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'acarapetis/vim-github-theme'
Plug 'tomasr/molokai'
" JS Plugins
" Plug 'marijnh/tern_for_vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'isruslan/vim-es6'
" Plug 'leafgarland/typescript-vim'
" Plug 'moll/vim-node'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'chemzqm/vim-jsx-improve'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'maksimr/vim-jsbeautify'
call plug#end()

" ==========================================
" Vim Plugin Options/Settings
" ==========================================
let g:gitgutter_enabled = 0
" let g:incsearch#auto_nohlsearch = 1
" let g:jsx_ext_required = 1
" let g:ycm_confirm_extra_conf = 0
" let g:gitgutter_highlight_lines = 1
" let g:gitgutter_enabled = 0
" let g:ycm_add_preview_to_completeopt = 1
" let  g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion=1
let g:jellybeans_overrides = {
\    'background': { 'guibg': '000000' },
\}

" ==========================================
" Colors
" ==========================================
syntax on
color jellybeans

" ==========================================
" GUI vs Console Vim Settings/Options
" ==========================================
if has("gui_running")
  color molokai
  set guifont=Bitstream\ Vera\ Sans\ Mono:h16
  set linespace=0
  set guicursor+=a:blinkon0
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=e  " remove graphical tabs
  set guicursor=i-ci:ver45
  hi Cursor guibg=red guifg=white
  hi VertSplit ctermbg=236 ctermfg=0 guibg=#1d1d1d guifg=#1d1d1d
  " hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
else
  hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
endif

" ==========================================
" Settings
" ==========================================

" General Settings
set backspace=indent,eol,start
set noswapfile
set viminfo+=/100
set nocompatible
" set scrolloff=5

" Enable mouse
" set mouse=a

" Set path for FZF
set rtp+=/usr/local/opt/fzf

" Tabs/Spacing/Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab smarttab
set autoindent
set smartindent

" Number Line
set number
set numberwidth=5

" Whitespace
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set nocursorline
set laststatus=0
set showmatch
set showtabline=2
set lazyredraw

set virtualedit=block
set nojoinspaces
set clipboard=unnamed

" SEARCH
" set hlsearch
" set smartcase
" set ignorecase

" Auto-completion
"list" When more than one match, list all matches.
set wildmenu
set wildmode=full
set completeopt=menuone,preview

" Go back to start of non-empty space of line
set nostartofline

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
  hi colorcolumn ctermbg=234 guibg=#e5e5e5
endif

" ==========================================
" Key mappings
" ==========================================
" Set Leader
let mapleader = ","

" Typos
command! W W
command! W w
command! Q q
command! E e
command! Wa wa
command! Wq wq

nnoremap <leader>g :GitGutterToggle<CR>
nnoremap ; :

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader>b :Buffers<CR>

" Conveniently make new tab
nmap <leader>t :tabnew<CR>
nmap <leader>h :nohlsearch<CR>

" Conveniently switch tabs
nnoremap ]w :tabn<cr>
nnoremap [w :tabp<cr>

" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

imap <C-c> <Esc>
nmap <C-p> :FZF<CR>
nmap <leader>p :GFiles<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :GitGutterToggle<CR>

nmap ;w :w<CR>
nmap ;qa :qa!<CR>

nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Right> :vertical resize -2<CR>
nnoremap <silent> <S-Left> :vertical resize +2<CR>




" ==========================================
" Functions
" ==========================================
" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Ref: Rename Current File (Gary Bernhardt)
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nmap <leader>rf :call RenameFile()<cr>

" Remember last cursor position on buffer
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\""
        \| endif
endif

" NERDTree Settings
" nnoremap <C-\> :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Remove whitspace
function! Strip()
  %s/\s\+$//e
endfunction

" Change hash rockets (:x => a) to new Ruby syntax (x: a)
function! RocketFix()
  %s/:\([^=,'"]*\) =>/\1:/gc
endfunction

function! ToggleNumberLine()
  if &number
    set nonumber
  else
    set number
  endif
endfunction
nmap <leader>n :call ToggleNumberLine()<CR>


" ==========================================
" Auto Commands
" ==========================================
augroup Indentation
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup VimStartup
  au!
  au VimEnter * if expand("%") == "" && argc() == 0 &&
        \ (v:servername =~ 'GVIM\d*' || v:servername == "")
        \ | e . | endif
augroup END

