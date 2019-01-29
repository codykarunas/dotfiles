" Author: Cody Karunas
" Filename: .vimrc
syntax on

" Vim-plug
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'docunext/closetag.vim'
Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
" Plug 'airblade/vim-gitgutter'
call plug#end()

let g:ycm_confirm_extra_conf = 0

if has("gui_running")
  set guifont=IBM\ Plex\ Mono:h14
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
  set guioptions-=e  " remove graphical tabs
  set cursorline
  set bg=dark
else
  color delek
  hi VertSplit ctermbg=236 ctermfg=236
  hi TabLineSel ctermfg=234 ctermbg=250
  hi TabLine ctermbg=234 ctermfg=250 cterm=NONE
  hi TabLineFill ctermbg=234 cterm=NONE
  " hi Visual ctermfg=96 ctermbg=253
  " hi VisualNOS ctermfg=60 cterm=NONE
endif

" Settings
set noswapfile
set rtp+=/usr/local/opt/fzf
set nu
set shiftwidth=2 tabstop=2 expandtab
set autoindent
set smartindent
set laststatus=2
set synmaxcol=500
set showtabline=2
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

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

nmap <leader>t :tabnew<CR>
nmap <leader>c :tabclose<CR>

" Kebinds
imap <C-c> <Esc>
nmap <C-p> :FZF<CR>
nmap <C-b> :buffers<CR>

" Laziness
nnoremap ; :

" Moving lines (Discovered: Apr 27, 2018)
" Ref: https://github.com/junegunn/dotfiles/blob/master/vimrc#L504
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" Fast and EZ window switching
" REF: https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux/402084
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Right> :vertical resize -2<CR>
nnoremap <silent> <S-Left> :vertical resize +2<CR>

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

" REF: https://gabri.me/blog/diy-vim-statusline
function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%t
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
" set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (
