" Initialisation:"{{{
" ----------------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let s:style = get(g:, 'lvimcolor', 'dark')
let g:colors_name = "lvim"
"}}}

" Palettes:"{{{
" ----------------------------------------------------------------------------

let s:palette = {}

let s:palette.bg        = {'dark': "#282828",  'light': "#282828",  'mirage': "#282828"}

let s:palette.comment   = {'dark': "#5A524C",  'light': "#5A524C",  'mirage': "#5A524C"}
let s:palette.markup    = {'dark': "#F2594B",  'light': "#F2594B",  'mirage': "#F2594B"}
let s:palette.constant  = {'dark': "#D5C4A1",  'light': "#D5C4A1",  'mirage': "#D5C4A1"}
let s:palette.operator  = {'dark': "#e78a4e",  'light': "#e78a4e",  'mirage': "#e78a4e"}
let s:palette.tag       = {'dark': "#00839F",  'light': "#00839F",  'mirage': "#00839F"}
let s:palette.regexp    = {'dark': "#5E8D60",  'light': "#5E8D60",  'mirage': "#5E8D60"}
let s:palette.string    = {'dark': "#A9B665",  'light': "#A9B665",  'mirage': "#A9B665"}
let s:palette.function  = {'dark': "#ea6962",  'light': "#ea6962",  'mirage': "#ea6962"}
let s:palette.special   = {'dark': "#7daea3",  'light': "#7daea3",  'mirage': "#7daea3"}
let s:palette.keyword   = {'dark': "#E6B673",  'light': "#E6B673",  'mirage': "#E6B673"}

let s:palette.error     = {'dark': "#ea6962",  'light': "#F2594B",  'mirage': "#F2594B"}
let s:palette.accent    = {'dark': "#E78A4E",  'light': "#E78A4E",  'mirage': "#E78A4E"}
let s:palette.panel     = {'dark': "#32302F",  'light': "#32302F",  'mirage': "#32302F"}
let s:palette.guide     = {'dark': "#484848",  'light': "#484848",  'mirage': "#484848"}
let s:palette.line      = {'dark': "#222222",  'light': "#222222",  'mirage': "#222222"}
let s:palette.selection = {'dark': "#191919",  'light': "#191919",  'mirage': "#191919"}
let s:palette.fg        = {'dark': "#D5C4A1",  'light': "#D5C4A1",  'mirage': "#D5C4A1"}
let s:palette.fg_idle   = {'dark': "#E6B673",  'light': "#E6B673",  'mirage': "#E6B673"}


"}}}

" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------

function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_gray
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field][s:style] " guibg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
let s:fg_none = ' guifg=NONE ctermfg=NONE'
for [key_name, d_value] in items(s:palette)
  call s:build_prim('bg', key_name)
  call s:build_prim('fg', key_name)
endfor
" }}}

" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
"}}}


" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! Normal"        .s:fg_fg          .s:bg_bg          .s:fmt_none
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
" Conceal, Cursor, CursorIM
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_accent      .s:bg_line        .s:fmt_none
exe "hi! LineNr"        .s:fg_guide       .s:bg_none        .s:fmt_none

exe "hi! Directory"     .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_string      .s:bg_panel       .s:fmt_none
exe "hi! DiffChange"    .s:fg_tag         .s:bg_panel       .s:fmt_none
exe "hi! DiffText"      .s:fg_fg          .s:bg_panel       .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_selection   .s:bg_error       .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_bg          .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_fg_idle     .s:bg_panel       .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_panel       .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_panel       .s:fmt_none
"   Incsearch"

exe "hi! MatchParen"    .s:fg_fg          .s:bg_bg          .s:fmt_undr
exe "hi! ModeMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_guide       .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_fg          .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_fg          .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_string      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_bg          .s:bg_constant    .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_tag         .s:bg_none        .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_keyword     .s:bg_none        .s:fmt_undr
exe "hi! SpellBad"      .s:fg_error       .s:bg_none        .s:fmt_undr
exe "hi! SpellRare"     .s:fg_regexp      .s:bg_none        .s:fmt_undr
exe "hi! StatusLine"    .s:fg_fg          .s:bg_panel       .s:fmt_none
exe "hi! StatusLineNC"  .s:fg_fg_idle     .s:bg_panel       .s:fmt_none
exe "hi! WildMenu"      .s:fg_bg          .s:bg_markup      .s:fmt_none
exe "hi! TabLine"       .s:fg_fg          .s:bg_panel       .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_keyword     .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_error       .s:bg_none        .s:fmt_none

" TODO LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

"}}}

" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment   .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_constant  .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_string    .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_tag       .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_function  .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_keyword   .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_operator  .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_special   .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_tag       .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_special   .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_special   .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_tag       .s:bg_none        .s:fmt_undr

exe "hi! Ignore"          .s:fg_none      .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_fg        .s:bg_error       .s:fmt_none

exe "hi! Todo"            .s:fg_markup    .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_keyword   .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

exe "hi! Conceal"           .s:fg_guide     .s:bg_none        .s:fmt_none
exe "hi! CursorLineConceal" .s:fg_guide     .s:bg_line        .s:fmt_none

" fix NvimTree colors
exe "hi! NvimTreeFolderIcon"  .s:fg_fg  .s:bg_none        .s:fmt_none
exe "hi! IndentMarker"        .s:fg_fg  .s:bg_none        .s:fmt_none


" Terminal
" ---------
if has("nvim")
  let g:terminal_color_0 =  s:palette.bg[s:style]
  let g:terminal_color_1 =  s:palette.markup[s:style]
  let g:terminal_color_2 =  s:palette.string[s:style]
  let g:terminal_color_3 =  s:palette.accent[s:style]
  let g:terminal_color_4 =  s:palette.tag[s:style]
  let g:terminal_color_5 =  s:palette.constant[s:style]
  let g:terminal_color_6 =  s:palette.regexp[s:style]
  let g:terminal_color_7 =  "#D5C4A1"
  let g:terminal_color_8 =  s:palette.fg_idle[s:style]
  let g:terminal_color_9 =  s:palette.error[s:style]
  let g:terminal_color_10 = s:palette.string[s:style]
  let g:terminal_color_11 = s:palette.accent[s:style]
  let g:terminal_color_12 = s:palette.tag[s:style]
  let g:terminal_color_13 = s:palette.constant[s:style]
  let g:terminal_color_14 = s:palette.regexp[s:style]
  let g:terminal_color_15 = s:palette.comment[s:style]
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = s:palette.fg[s:style]
else
  let g:terminal_ansi_colors =  [s:palette.bg[s:style],      s:palette.markup[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  "#D5C4A1"]
  let g:terminal_ansi_colors += [s:palette.fg_idle[s:style], s:palette.error[s:style]]
  let g:terminal_ansi_colors += [s:palette.string[s:style],  s:palette.accent[s:style]]
  let g:terminal_ansi_colors += [s:palette.tag[s:style],     s:palette.constant[s:style]]
  let g:terminal_ansi_colors += [s:palette.regexp[s:style],  s:palette.comment[s:style]]
endif


" NerdTree
" ---------
exe "hi! NERDTreeOpenable"          .s:fg_fg_idle     .s:bg_none        .s:fmt_none
exe "hi! NERDTreeClosable"          .s:fg_accent      .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksHeader"   .s:fg_pink        .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarksLeader"   .s:fg_bg          .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeBookmarkName"      .s:fg_keyword     .s:bg_none        .s:fmt_none
" exe "hi! NERDTreeCWD"               .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! NERDTreeUp"                .s:fg_fg_idle    .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDir"               .s:fg_function   .s:bg_none        .s:fmt_none
exe "hi! NERDTreeFile"              .s:fg_none       .s:bg_none        .s:fmt_none
exe "hi! NERDTreeDirSlash"          .s:fg_accent     .s:bg_none        .s:fmt_none



" GitGutter
" ---------
exe "hi! GitGutterAdd"          .s:fg_string     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChange"       .s:fg_tag        .s:bg_none        .s:fmt_none
exe "hi! GitGutterDelete"       .s:fg_markup     .s:bg_none        .s:fmt_none
exe "hi! GitGutterChangeDelete" .s:fg_function   .s:bg_none        .s:fmt_none

"}}}

" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded String
"   diffLine
"   diffSubname
"   diffComment

"}}}
"
" This is needed for some reason: {{{

let &background = s:style

" }}}
