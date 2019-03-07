" Vim color file
" Maintainer:	Cody Karunas <codykarunas@gmail.com>

" Ref: https://jonasjacek.github.io/colors/

" First remove all existing highlighting.
hi clear

let colors_name = "delek2"

" hi Normal guifg=Black guibg=white
hi Normal guifg=white guibg=black

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi VertSplit term=reverse cterm=reverse gui=reverse
" hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi Visual       ctermfg=255 guifg=#eeeeee ctermbg=96  guibg=#875f87
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=Blue
hi LineNr term=underline ctermfg=Brown guifg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan

hi StatusLine	cterm=bold ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold ctermbg=blue ctermfg=black  guibg=gold guifg=blue
" Default startup uses NonText
" hi NonText term=bold ctermfg=Blue gui=bold guifg=gray guibg=white
hi NonText term=bold ctermfg=Blue gui=bold guifg=darkred guibg=black
hi Cursor  guibg=red guifg=black

" syntax highlighting
hi PreProc    term=underline cterm=NONE ctermfg=darkmagenta  gui=NONE guifg=magenta3
hi Identifier term=underline cterm=BOLD ctermfg=98     gui=NONE guifg=#875fd7
hi Comment    term=NONE      cterm=BOLD ctermfg=88      gui=ITALIC guifg=darkred
hi Constant   term=underline cterm=NONE ctermfg=23    gui=NONE guifg=#005f5f
hi Special    term=bold      cterm=NONE ctermfg=lightred     gui=NONE guifg=deeppink
hi Statement  term=bold      cterm=bold ctermfg=33         gui=bold guifg=#0087ff
" hi Type	      term=underline cterm=NONE ctermfg=blue         gui=bold guifg=blue
hi Type	      term=underline cterm=NONE ctermfg=167         gui=bold guifg=#d75f5f	

if exists("syntax_on")
  let syntax_cmd = "enable"
  runtime syntax/syncolor.vim
  unlet syntax_cmd
endif

" vim: sw=2
