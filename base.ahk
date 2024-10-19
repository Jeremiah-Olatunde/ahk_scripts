#Requires AutoHotkey v2.0
#SingleInstance Force

#SuspendExempt
PgUp::Suspend
#SuspendExempt False

CoordMode "ToolTip", "Screen"



; LAYER CONTROL
;------------------------------------------------------------------------------

; ; Layers = "BASE" | "WM_NUM" | "SYM_NAV"

; ; BASE: default layer. colemak layout 
; ; WM_NUM: tiling window manager (komorebi) and number layer
; ; SYM_NAV: symbols and navigation(arrow) keys

global Layer := "BASE" ; 

;------------------------------------------------------------------------------



; BASE LAYER
;------------------------------------------------------------------------------

; COLEMAK(DH WIDE)
; layout inspired by colemak(dh), deprioritizing the symbol keys
; which are moved to the symbol layer

#HotIf Layer = "BASE"
; TOP ROW
Tab::Return
$q::q
$w::w
$e::f
$r::p
$t::b
$y::Return
$u::j
$i::l
$o::u
$p::y
$[::Return
$]::Return
$\::Return

; HOME ROW
$CapsLock::RControl
$a::a
$s::r
$d::s
$f::t
$g::g
$h::Return
$j::m
$k::n
$l::e
$`;::i
$'::o
$Enter::Return

; BOTTOM ROW
$LShift::LControl
$z::x
$x::c
$c::d
$v::Return
$b::v
$n::Return
$m::k
$,::h
$/::z
$.::Return
#HotIf
;------------------------------------------------------------------------------