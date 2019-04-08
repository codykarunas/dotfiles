" Author: Cody Karunas
" Filename: .vimrc
syntax on

" Vim-plug
call plug#begin()
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'docunext/closetag.vim'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/django.vim'
Plug 'haya14busa/incsearch.vim'

" Plug 'itchyny/lightline.vim'

Plug 'w0ng/vim-hybrid'
Plug 'acarapetis/vim-github-theme'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'

" JS Plugins
Plug 'marijnh/tern_for_vim'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'isruslan/vim-es6'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
call plug#end()

let g:incsearch#auto_nohlsearch = 1
let g:jsx_ext_required = 1
let g:ycm_confirm_extra_conf = 0
" let g:gitgutter_highlight_lines = 1

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ 'enable': {
"       \   'tabline': 0
"       \ }
"       \ }

let g:gitgutter_enabled = 0

" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1 "Not working ??"
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:jellybeans_overrides = {
" \    'background': { 'guibg': '000000' },
" \}
" color jellybeans
color hybrid
set bg=dark

if has("gui_running")
  set guifont=IBM\ Plex\ Mono\ Text:h16
  set linespace=0
  set guicursor+=a:blinkon0
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=e  " remove graphical tabs
  set guicursor=i-ci:hor20
  " set guicursor=i-ci:ver30
  " set guicursor=i-ci:ver30
  " hi Cursor guibg=limegreen guifg=black
  hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
  hi Normal ctermbg=0 guibg=#000000
  hi VertSplit ctermbg=236 ctermfg=0 guibg=#1d1d1d guifg=#1d1d1d
  hi TabLineSel guifg=#000000 guibg=#ffffff ctermfg=233 ctermbg=255 cterm=BOLD gui=BOLD
  hi TabLine guifg=#ffffff guibg=#000000 ctermbg=245 ctermfg=0 cterm=NONE gui=BOLD
  hi TabLineFill guifg=#000000 ctermbg=0 cterm=NONE gui=NONE
else
  hi SpecialKey ctermbg=red ctermfg=white guifg=white guibg=red
  hi Normal ctermbg=0 guibg=#000000
  " hi LineNr ctermfg=3
  " hi Statement ctermfg=3
  " hi LineNr ctermfg=238 cterm=NONE
  " hi Cursorline ctermbg=232 cterm=NONE guibg=#303030
  " hi StatusLine ctermbg=235 ctermfg=248
  hi VertSplit ctermbg=234 ctermfg=234 guibg=#1d1d1d guifg=#1d1d1d
  hi TabLineSel guifg=#000000 guibg=#ffffff ctermfg=233 ctermbg=255 cterm=BOLD gui=BOLD
  hi TabLine guifg=#ffffff guibg=#000000 ctermbg=245 ctermfg=0 cterm=NONE gui=BOLD
  hi TabLineFill guifg=#000000 ctermbg=0 cterm=NONE gui=NONE
  " hi Visual ctermfg=96 ctermbg=253
  " hi VisualNOS ctermfg=60 cterm=NONE
endif

" Settings
" set clipboard=unnamed
" set nocompatible
set nu
set laststatus=2
set mouse=a
set showmatch
set numberwidth=1
set backspace=indent,eol,start
set noswapfile
set rtp+=/usr/local/opt/fzf
set viminfo+=/100
set shiftwidth=2 tabstop=2 expandtab
set autoindent
set smartindent
set showtabline=1
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse=a

" Typos
command! W W
command! W w
command! Q q
command! E e
command! Wa wa
command! Wq wq

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Leader
let mapleader = ","

" Conveniently make new tab
nmap <leader>t :tabnew<CR>
nmap <leader>h :nohlsearch<CR>

" Conveniently switch tabs
" nmap <C-]> :tabnext<CR>
" nmap <C-[> :tabprevious<CR>

imap <C-c> <Esc>
nmap <C-p> :FZF<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :GitGutterToggle<CR>

nnoremap ; :

" Moving lines (Discovered: Apr 27, 2018)
" Ref: https://github.com/junegunn/dotfiles/blob/master/vimrc#L504
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" REF: https://unix.stackexchange.com/questions/134759/running-a-vim-key-combination-on-startup
" The key map <C-]> sends a 2B key on vim start up.
" This autocmd clears the command bar.

" Fast and EZ window switching
" B
" REF: https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux/402084
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" nnoremap <silent> <S-Down> :resize +2<CR>
" nnoremap <silent> <S-Up> :resize -2<CR>
" nnoremap <silent> <S-Right> :vertical resize -2<CR>
" nnoremap <silent> <S-Left> :vertical resize +2<CR>

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
map <leader>n :call RenameFile()<cr>

" Reference:
"   https://askubuntu.com/questions/202075/how-do-i-get-vim-to-remember-the-line-i-was-on-when-i-reopen-a-file
if has("autocmd")
  " au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\""
        \| endif
endif

" NERDTree Settings
nnoremap <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
