#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "ToolTip", "Screen"

#SuspendExempt
PgUp::Suspend
#SuspendExempt False

; LAYER CONTROL
;------------------------------------------------------------------------------

; Layers = "BASE" | "SYMBOL"

; BASE: default layer. colemak layout 
; SYMBOL: layer dedicated primarily to symbols

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
$v::{
  global Layer := "SYMBOL"
  ToolTip
  ToolTip "SYMBOL", 1920, 1080
}
$b::v
$n::Return
$m::k
$,::h
$/::z
$.::Return
#HotIf
;------------------------------------------------------------------------------