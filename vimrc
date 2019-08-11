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
" Plug 'ervandew/supertab'
" Plug 'w0rp/ale'
Plug 'greymd/oscyank.vim'
Plug 'mhinz/vim-signify'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'haya14busa/incsearch.vim'
" Plug 'acarapetis/vim-github-theme'
" Plug 'nanotech/jellybeans.vim'
" Plug 'tomasr/molokai'
" Plug 'w0ng/vim-hybrid'
" Plug 'AlessandroYorba/Despacio'
" Plug 'junegunn/seoul256.vim'
call plug#end()

" ============================================================================
" Vim Plugin Options/Settings
" ============================================================================
" let g:jsx_ext_required = 1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion=1
let g:molokai_original = 1

let g:signify_disable_by_default = 1
let g:signify_update_on_bufenter = 1

" REF: https://dmerej.info/blog/post/lets-have-a-pint-of-vim-ale/
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" let g:netrw_liststyle = 3
" let g:netrw_banner = 0

syntax on

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" let g:seoul256_background = 233
" colo seoul256

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" let g:seoul256_background = 256
" colo seoul256

" let g:despacio_Pitch = 1
" colorscheme despacio

" ============================================================================
" GUI vs Console Vim Settings/Options
" ============================================================================
if has("gui_running")
  let g:jellybeans_overrides = {
        \    'background': { 'guibg': '000000' },
        \}
  color jellybeans
  set guifont=Monaco:h14
  set linespace=0
  set guicursor+=a:blinkon0
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=e  " remove graphical tabs
  set guicursor=i-ci:ver40
  " set guicursor=i-ci:hor20
  hi Cursor guibg=limegreen guifg=red

  " Default: `highlight link ALEError SpellBad`
  hi SpellBad guisp=#8700af
  hi ALEError guisp=#8700af gui=UNDERCURL
  hi ALEWarning guibg=NONE guifg=NONE guisp=HotPink gui=UNDERCURL

  " hi VertSplit ctermbg=236 ctermfg=0 guibg=#1d1d1d guifg=#1d1d1d
  " hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
else
  set bg=light
  " let g:jellybeans_overrides = {
  "       \    'background': { 'guibg': '000000' },
  "       \}
  " color jellybeans

  " ============================================================================
  " Colors
  " ============================================================================
  hi Visual ctermbg=236 cterm=NONE
  hi ColorColumn ctermbg=234 cterm=NONE
  hi Search ctermbg=yellow ctermfg=234  cterm=BOLD

  hi VertSplit ctermfg=235 ctermbg=235

  hi TabLineFill ctermfg=0 cterm=NONE
  hi TabLine     ctermbg=0 ctermbg=240 cterm=NONE
  hi TabLineSel  ctermfg=0 ctermbg=250 cterm=NONE

  hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red

  hi Pmenu    ctermbg=252 ctermfg=darkblue
  hi PmenuSel ctermbg=magenta ctermfg=0

  " fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  " White = 22
  " DarkRed = 52
  " DarkBlue = 18
  hi MatchParen ctermbg=blue ctermfg=0
  hi SignColumn ctermbg=232

  hi Error              ctermbg=52 ctermfg=250
  hi QuickFixLine       ctermbg=52 ctermfg=250
  hi SyntasticErrorLine ctermbg=233

  hi DiffAdd    guifg=#D2EBBE guibg=#437019 ctermfg=15 ctermbg=22
  hi DiffDelete guibg=#40000A guifg=#700009 ctermfg=0 ctermbg=52
  hi DiffChange guifg=#005f87 ctermfg=White ctermbg=24 ctermfg=White
  hi DiffText   guifg=#8fbfdc guibg=#000000 gui=reverse ctermfg=Yellow

  hi SpellBad   guisp=#8700af
  hi ALEError   guisp=#8700af gui=UNDERCURL
  hi ALEWarning ctermbg=236 ctermfg=NONE guibg=NONE guifg=NONE guisp=HotPink gui=UNDERCURL
endif

" ============================================================================
" Settings
" ============================================================================
" General Settings
set hlsearch
set showcmd
set softtabstop=2
set tabstop=2
set shiftwidth=2
" set colorcolumn=80
set backspace=indent,eol,start
set noswapfile
set viminfo+=/100
set nocompatible
set scrolloff=5

" set synmaxcol=500

set mouse=a

" Tabs/Spacing/Indentation
" Expand tabs, but set shiftwidth and softtabstop to 2.  This allows vim
" to mix tabs and spaces in Ruby C code, but it looks correct
set expandtab
" set shiftwidth=2
" set softtabstop=2
set autoindent
set smartindent

" Number Line
set number

" Whitespace
set nolist
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set laststatus=2
set showmatch
set showtabline=1
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

nnoremap <leader>rt :Dispatch rails test %<CR>
nnoremap <leader>a :ALEToggleBuffer<CR>
nnoremap <leader>g :SignifyToggle<CR>
" nnoremap <leader>g :GitGutterToggle<CR>

" ----------------------------------------------------------------------------
" Quality of Life
" ----------------------------------------------------------------------------
" Typos
command! W w
command! Q q
command! E e
command! Wa wa
command! Wq wq

nnoremap ; :

" nnoremap ;w :w
nnoremap ;qa :qa!<CR>

nnoremap <C-a> <C-y>
nnoremap <C-D> 3<C-D>
nnoremap <C-U> 3<C-U>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Quality of life for resizing window panes easily
nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Left> :vertical resize -2<CR>
nnoremap <silent> <S-Right> :vertical resize +2<CR>

" REF: https://github.com/greymd/oscyank.vim
" Share clipboard with pbcopy
noremap <leader>y :Oscyank<cr>
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

nmap <leader>p :FZF<CR>
imap <C-c> <Esc>
nmap <C-p> :FZF<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :GitGutterToggle<CR>

nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

nmap <C-\> :NERDTreeToggle<CR>
" nmap <C-\> :Lexplore25<CR>

" Toggle Diffs On Windows
function! ToggleDiffThis()
  if &diff
    :windo diffoff
  else
    :windo diffthis
  end
endfunction
nmap <leader>df :call ToggleDiffThis()<CR>

function! ToggleNetrw()
  if &
endfunction


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
" Find/Replace Word
" ----------------------------------------------------------------------------
function! FindReplaceText()
  " nmap <leader>f :%s/
endfunction

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
" REF: https://thoughtbot.com/blog/wrap-existing-text-at-80-characters-in-vim
augroup MyFileTypes
  au BufRead,BufNewFile *.md setlocal textwidth=80
  " au FileType ruby,eruby,yaml,md setlocal colorcolumn=80
augroup END

" if &diff
"     colorscheme jellybeans
" endif

" ===== Custom Language Settings =====
autocmd Filetype c    setlocal tabstop=8
autocmd Filetype cpp  setlocal tabstop=8


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

" ============================================================================
" Statusline
" ============================================================================
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

augroup templates
  autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
augroup END

au FileType qf setlocal nonumber colorcolumn=

