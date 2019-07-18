" ============================================================================
" Author:   Cody Karunas
" Filename: .vimrc
" ============================================================================

" ============================================================================
" Vim-plug
" ============================================================================
filetype plugin indent on

call plug#begin()
" Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
" Plug 'w0rp/ale'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'nanotech/jellybeans.vim'
Plug 'acarapetis/vim-github-theme'
Plug 'tomasr/molokai'
Plug 'vim-scripts/Gummybears'
Plug 'haya14busa/incsearch.vim'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" ============================================================================
" Vim Plugin Options/Settings
" ============================================================================
let g:gitgutter_enabled = 0
" let g:incsearch#auto_nohlsearch = 1
" let g:jsx_ext_required = 1
" let g:ycm_confirm_extra_conf = 0
" let g:gitgutter_highlight_lines = 1
" let g:gitgutter_enabled = 0
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion=1
let g:molokai_original = 1

syntax on

let g:jellybeans_overrides = {
      \    'background': { 'guibg': '000000' },
      \}

" ============================================================================
" GUI vs Console Vim Settings/Options
" ============================================================================
if has("gui_running")
  color molokai
  set guifont=IBM\ Plex\ Mono:h14
  set guicursor+=a:blinkon0
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=e  " remove graphical tabs
  set guicursor=i-ci:hor20
  hi Cursor guibg=red guifg=white
  " hi VertSplit ctermbg=236 ctermfg=0 guibg=#1d1d1d guifg=#1d1d1d
  " hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
else
  set bg=light

  hi hlsearch ctermbg=234 ctermfg=red cterm=UNDERLINE

  " TabLine Highlighting
  hi TabLineFill ctermfg=0 cterm=NONE
  hi TabLine ctermbg=0 ctermbg=240 cterm=NONE
  hi TabLineSel ctermfg=0 ctermbg=250 cterm=NONE

  " Make whitespace more obvious
  hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
endif

" ============================================================================
" Settings
" ============================================================================
" General Settings
set relativenumber
set backspace=indent,eol,start
set noswapfile
set viminfo+=/100
set nocompatible
" set scrolloff=5

" Tabs/Spacing/Indentation
" Expand tabs, but set shiftwidth and softtabstop to 2.  This allows vim
" to mix tabs and spaces in Ruby C code, but it looks correct
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" Number Line
set number
set numberwidth=5

" Whitespace
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set laststatus=2
set showmatch
set showtabline=2
set lazyredraw

set virtualedit=block
set nojoinspaces
set clipboard=unnamed

set splitright
set nowrap

" SEARCH
" set smartcase
" set ignorecase

" Auto-completion
"list" When more than one match, list all matches.
set wildmenu
set wildmode=list:full
set completeopt=menuone,preview

" Go back to start of non-empty space of line
set nostartofline

" ============================================================================
" Key mappings
" ============================================================================
" Set Leader
let mapleader = ","

" INCSEARCH
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Typos
command! W W
command! W w
command! Q q
command! E e
command! Wa wa
command! Wq wq

nnoremap <leader>g :GitGutterToggle<CR>

" ----------------------------------------------------------------------------
" Quality of Life
" ----------------------------------------------------------------------------
nnoremap ; :
nnoremap ;w :w<CR>
nnoremap ;qa :qa!<CR>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Right> :vertical resize -2<CR>
nnoremap <silent> <S-Left> :vertical resize +2<CR>

" ----------------------------------------------------------------------------
" TABS
" ----------------------------------------------------------------------------
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>h :nohlsearch<CR>

" Make it navigate tabs
nnoremap ]w :tabn<cr>
nnoremap [w :tabp<cr>

" Make it easier to re-arrange tabs
nnoremap [e :tabm -1<CR>
nnoremap ]e :tabm +1<CR>

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap <leader>b :Buffers<CR>

imap <C-c> <Esc>
nnoremap <silent><C-p> :FZF<CR>
nnoremap <silent><leader>p :FZF<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :GitGutterToggle<CR>

nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nmap <C-\> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" RUN MINITEST
" ----------------------------------------------------------------------------

" Run test on current file
nmap <leader>r :!rails test %<CR>

" ----------------------------------------------------------------------------
" JUNEGUNN EASY ALIGN
" ----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" JUNEGUNN FZF INSERT MODE COMPLETION
" ----------------------------------------------------------------------------
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ============================================================================
" Functions
" ============================================================================
" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" ----------------------------------------------------------------------------
" Ref: Rename Current File (Author: Gary Bernhardt)
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" Remember last cursor position on buffer
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" Remove whitspace
" ----------------------------------------------------------------------------
function! Strip()
  %s/\s\+$//e
endfunction

" ----------------------------------------------------------------------------
" Change hash rockets (:x => a) to new Ruby syntax (x: a)
" ----------------------------------------------------------------------------
function! RocketFix()
  %s/:\([^=,'"]*\) =>/\1:/gc
endfunction

" ----------------------------------------------------------------------------
" Toggle Line Numbers
" ----------------------------------------------------------------------------
function! ToggleNumberLine()
  if &number
    set nonumber
  else
    set number
  endif
endfunction
nmap <silent><leader>n :call ToggleNumberLine()<CR>

function! ToggleCursorLine()
  if &cursorline
    set nocursorline
  else
    set cursorline
  end
endfunction
nmap <silent><leader>c :call ToggleCursorLine()<CR>

" ============================================================================
" Auto Commands
" ============================================================================

" ----------------------------------------------------------------------------
" FileType Indentations
" ----------------------------------------------------------------------------
augroup MyFileTypes
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
  " autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
augroup END

augroup VimStartup
  au!
  au VimEnter * if expand("%") == "" && argc() == 0 &&
        \ (v:servername =~ 'GVIM\d*' || v:servername == "")
        \ | e . | endif
augroup END

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

if &diff
  " color github
endif

set statusline =
" Buffer number
set statusline +=[%n]
" File description
" set statusline +=%f\ %h%m%r%w
set statusline +=%t\ %h%m%r%w
" Filetype
set statusline +=%y
" Name of the current branch (needs fugitive.vim)
set statusline +=\ %{fugitive#statusline()}
" Total number of lines in the file
set statusline +=%=%-10L
" Line, column and percentage
set statusline +=%=%-14.(%l,%c%V%)\ %P
