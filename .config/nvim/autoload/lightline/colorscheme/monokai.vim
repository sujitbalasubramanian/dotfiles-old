let s:blue   = [ '#61afef', 75 ]
let s:green1  = [ '#98c379', 76 ]
let s:green  = [ '#a6e22d', 148 ]
let s:purple = [ '#c678dd', 176 ]
let s:red1   = [ '#e06c75', 168 ]
let s:red2   = [ '#be5046', 168 ]
let s:yellow = [ '#e7dc6d', 228 ]
let s:pink = [ '#F92772', 197 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:fg    = [ '#abb2bf', 145 ]
let s:bg    = [ '#5f5f5f', 235 ]
let s:charcoal = [ '#262626', 235]
let s:gray1 = [ '#8a8a8a', 241 ]
let s:gray2 = [ '#5f5f5f', 235 ]
let s:gray3 = [ '#444444', 240 ]
let s:black = [ '#000000', 16  ]

let s:p.inactive.left   = [ [ s:charcoal,  s:gray2 ] ]
let s:p.inactive.middle = [ [ s:gray2, s:gray3 ] ]
let s:p.inactive.right  = [ [ s:charcoal, s:gray1 ], [ s:charcoal, s:gray2 ] ]
let s:p.normal.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray3 ] ]
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:black, s:gray1 ], [ s:fg, s:gray2] ]
let s:p.normal.error   = [ [ s:red2, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:yellow, 'bold' ], [ s:fg, s:gray1 ], [ s:fg, s:gray2] ]
let s:p.insert.left    = [ [ s:bg, s:yellow, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray1 ], [ s:fg, s:gray2] ]
let s:p.replace.left   = [ [ s:bg, s:red1, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:pink, 'bold' ], [ s:fg, s:gray1 ], [ s:fg, s:gray2] ]
let s:p.visual.left    = [ [ s:bg, s:pink, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:green, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#monokai#palette = lightline#colorscheme#flatten(s:p)
