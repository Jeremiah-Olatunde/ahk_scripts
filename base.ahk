#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "ToolTip", "Screen"

#SuspendExempt
PgUp::Suspend
#SuspendExempt False

; LAYER CONTROL
;------------------------------------------------------------------------------

; Layers = "BASE" | "WM_NUM" | "SYM_NAV"

; BASE: default layer. colemak layout 
; WM_NUM: tiling window manager (komorebi) and number layer
; SYM_NAV: symbols and navigation(arrow) keys

global Layer := "BASE" ; 

; NOTE
; executes before colemak remapping
; keys are mapped as they are by default

; f key always returns to BASE layer unless already in BASE layer
#HotIf Layer != "BASE"
f::{
  global Layer := "BASE"
  ToolTip
  ToolTip "BASE Layer", 1920, 1080
}
#HotIf


#HotIf Layer != "WM_NUM"
b::{
  global Layer := "WM_NUM"
  ToolTip
  ToolTip "WM_NUM Layer", 1920, 1080
}
#HotIf

;------------------------------------------------------------------------------


; MODIFIERS
;------------------------------------------------------------------------------

CapsLock::LControl

;------------------------------------------------------------------------------

; COLEMAK(DH)
; layout inspired by colemak(dh), deprioritizing the symbol keys
; which are moved to the symbol layer
;------------------------------------------------------------------------------

; COLEMAK
; TOP ROW
; $q::q
; $w::w
; $e::f
; $r::p
; $t::g
; $y::Return
; $u::Return
; $i::j
; $o::l
; $p::u
; $[::y
; $]::Return

; ; HOME ROW
; $a::a
; $s::r
; $d::s
; #HotIf Layer = "BASE"
; $f::t
; #HotIf
; $g::d
; $h::Return
; $j::h
; $k::n
; $l::e
; $`;::i
; $'::o

; ; BOTTOM ROW
; $z::z
; $x::x
; $c::c
; $v::v
; #HotIf Layer = "WM_NUM"
; $b::Return
; #HotIf
; $n::Return
; $m::Return
; $,::b
; $.::k
; $/::m

; COLEMAK_DH
; TOP ROW
$q::q
$w::w
$e::f
$r::p
$t::g
$y::Return
$u::Return
$i::j
$o::l
$p::u
$[::y
$]::Return

; HOME ROW
$a::a
$s::r
$d::s
#HotIf Layer = "BASE"
$f::t
#HotIf
$g::g
$h::Return
$j::m
$k::n
$l::e
$`;::i
$'::o

; BOTTOM ROW
$z::z
$x::x
$c::d
$v::v
#HotIf Layer = "WM_NUM"
$b::Return
#HotIf
$n::Return
$m::Return
$,::z
$.::k
$/::h


;------------------------------------------------------------------------------

