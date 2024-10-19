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



; DEFAULT (DISABLE ALL KEYS IN LAYER)
;------------------------------------------------------------------------------
; #HotIf Layer = "LAYER_NAME"
; ; TOP ROW
; Tab::Return
; $q::Return
; $w::Return
; $e::Return
; $r::Return
; $t::Return
; $y::Return
; $u::Return
; $i::Return
; $o::Return
; $p::Return
; $[::Return
; $]::Return
; $\::Return

; ; HOME ROW
; $CapsLock::Return
; $a::Return
; $s::Return
; $d::Return
; $f::Return
; $g::Return
; $h::Return
; $j::Return
; $k::Return
; $l::Return
; $`;::Return
; $'::Return
; $Enter::Return

; ; BOTTOM ROW
; $LShift::Return
; $z::Return
; $x::Return
; $c::Return
; $v::Return
; $b::Return
; $n::Return
; $m::Return
; $,::Return
; $/::Return
; $.::Return
; #HotIf
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
$.::Return
$/::z
$RShift::RControl
#HotIf
;------------------------------------------------------------------------------


; SYMBOL LAYER
;------------------------------------------------------------------------------
#HotIf Layer = "SYMBOL"
; TOP ROW
Tab::Return
$q::Return
$w::Return
$e::Return
$r::Return
$t::Return
$y::Return
$u::Return
$i::Return
$o::{
  global Layer := "BASE"
  ToolTip
  ToolTip "BASE", 1920, 1080  
}
$p::Return
$[::Return
$]::Return
$\::Return

; HOME ROW
$CapsLock::LControl
$a::Return
$s::Return
$d::Return
$f::Return
$g::Return
$h::Return
$j::Return
$k::=
$l::<
$`;::Return
$'::Return
$Enter::Return

; BOTTOM ROW
$LShift::LShift
$z::Return
$x::Return
$c::Return
$v::Return
$b::Return
$n::Return
$m::Return
$,::Return
$.::Return
$/::Return
$RShift::RControl
#HotIf
;------------------------------------------------------------------------------