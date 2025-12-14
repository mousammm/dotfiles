if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'pacum'

if &background == 'dark'
  " Basic colors with WHITE text
  hi Normal ctermbg=NONE ctermfg=15 guibg=NONE guifg=#ffffff
  hi Comment ctermfg=8 guifg=#808080
  hi Constant ctermfg=12 guifg=#0000ff
  hi Identifier ctermfg=6 guifg=#00ffff
  hi Statement ctermfg=14 guifg=#00ffff
  hi PreProc ctermfg=10 guifg=#00ff00
  hi Type ctermfg=2 guifg=#00ff00
  hi Special ctermfg=9 guifg=#ff0000
  
  " UI elements - CURRENT LINE NUMBER WHITE, others gray
  hi LineNr ctermbg=NONE ctermfg=8 guibg=NONE guifg=#808080  " Gray line numbers
  hi CursorLineNr ctermbg=NONE ctermfg=255 guibg=NONE guifg=#ffffff  " WHITE current line number
  
  " Make sure CursorLine is transparent too if you want
  hi CursorLine ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
  hi ColorColumn ctermbg=0 ctermfg=NONE guibg=#000000 guifg=NONE
  hi SignColumn ctermbg=NONE ctermfg=8 guibg=NONE guifg=#808080
  
  " Status line
  hi StatusLine ctermbg=8 ctermfg=15 guibg=#808080 guifg=#ffffff
  hi StatusLineNC ctermbg=0 ctermfg=8 guibg=#000000 guifg=#808080
  
  " Menu
  hi Pmenu ctermbg=0 ctermfg=15 guibg=#000000 guifg=#ffffff
  hi PmenuSel ctermbg=4 ctermfg=15 guibg=#000080 guifg=#ffffff
  
  " Search
  hi Search ctermbg=11 ctermfg=0 guibg=#ffff00 guifg=#000000
  hi IncSearch ctermbg=9 ctermfg=0 guibg=#ff0000 guifg=#000000
  
  " Cursor
  hi Cursor ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#000000
  hi lCursor ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#000000
  
  " Other important groups
  hi Directory ctermfg=12 guifg=#0000ff
  hi ErrorMsg ctermbg=9 ctermfg=15 guibg=#ff0000 guifg=#ffffff
  hi WarningMsg ctermfg=9 guifg=#ff0000
  hi ModeMsg ctermfg=15 guifg=#ffffff
  hi MoreMsg ctermfg=10 guifg=#00ff00
  hi Question ctermfg=10 guifg=#00ff00
  hi Title ctermfg=13 guifg=#ff00ff
  
  hi Visual ctermbg=0 ctermfg=250 guibg=NONE guifg=#333333
  hi VisualNOS ctermbg=NONE ctermfg=5 guibg=NONE guifg=#ffffff
  
  hi NonText ctermfg=8 guifg=#808080
  hi MatchParen ctermbg=6 ctermfg=0 guibg=#00ffff guifg=#000000
  
  " Diff
  hi DiffAdd ctermbg=2 ctermfg=0 guibg=#00ff00 guifg=#000000
  hi DiffChange ctermbg=3 ctermfg=0 guibg=#ffff00 guifg=#000000
  hi DiffDelete ctermbg=1 ctermfg=0 guibg=#ff0000 guifg=#000000
  hi DiffText ctermbg=11 ctermfg=0 guibg=#ffff00 guifg=#000000
  
  " Fold
  hi Folded ctermbg=0 ctermfg=8 guibg=#000000 guifg=#808080
  hi FoldColumn ctermbg=0 ctermfg=8 guibg=#000000 guifg=#808080
  
  " Tab line
  hi TabLine ctermbg=0 ctermfg=8 guibg=#000000 guifg=#808080
  hi TabLineFill ctermbg=0 ctermfg=8 guibg=#000000 guifg=#808080
  hi TabLineSel ctermbg=8 ctermfg=15 guibg=#808080 guifg=#ffffff
  
  " Spell
  hi SpellBad ctermbg=1 ctermfg=15 gui=undercurl guisp=#ff0000
  hi SpellCap ctermbg=4 ctermfg=15 gui=undercurl guisp=#0000ff
  hi SpellLocal ctermbg=6 ctermfg=15 gui=undercurl guisp=#00ffff
  hi SpellRare ctermbg=5 ctermfg=15 gui=undercurl guisp=#ff00ff
  
  " Special
  hi SpecialKey ctermfg=8 guifg=#808080
  hi Whitespace ctermfg=8 guifg=#808080
  
  " Insert mode cursor
  hi CursorIM ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#000000
  
else
  " Light mode - minimal if you don't use it
  hi Normal ctermbg=NONE ctermfg=0 guibg=NONE guifg=#000000
  hi LineNr ctermbg=NONE ctermfg=8 guibg=NONE guifg=#808080
  hi CursorLineNr ctermbg=NONE ctermfg=15 guibg=NONE guifg=#ffffff
endif

" Links for syntax highlighting
hi! link String Constant
hi! link Character Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant
hi! link Function Identifier
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link Debug Special
hi! link Underlined Special
hi! link Ignore Comment
hi! link Error ErrorMsg
hi! link Todo Special
