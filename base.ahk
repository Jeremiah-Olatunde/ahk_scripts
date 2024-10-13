#Requires AutoHotkey v2.0

; LAYER CONTROL
;------------------------------------------------------------------------------

; Layers = "BASE" | "WM_NUM" | "SYM_NAV"

; BASE: default layer. colemak layout 
; WM_NUM: tiling window manager (komorebi) and number layer
; SYM_NAV: symbols and navigation(arrow) keys

global Layer := "BASE" ; 

; f key always returns to BASE layer unless already in BASE layer
#HotIf Layer != "BASE"
f::{
  global Layer := "BASE"
}
#HotIf
;------------------------------------------------------------------------------


; MODIFIERS
;------------------------------------------------------------------------------

CapsLock::LControl

;------------------------------------------------------------------------------

; COLEMAK
; layout inspired by colemak, deprioritizing the symbol keys
; which are moved to the symbol layer
;------------------------------------------------------------------------------

; TOP ROW
q::q
w::w
e::f
r::p
t::g
y::Return
u::Return
i::j
o::l
p::u
[::y
]::Return

; HOME ROW
a::a
s::r
d::s
#HotIf Layer = "BASE"
f::t
g::d
h::Return
j::h
k::n
l::e
`;::i
'::o

; BOTTOM ROW
z::z
x::x
c::c
v::v
b::Return 
n::Return
m::Return
,::b
.::k
/::m

;------------------------------------------------------------------------------