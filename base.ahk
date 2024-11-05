; CONVENTION

; built in identifiers are CamelCased 
; user defined identifers are snake_cased

#Requires AutoHotkey v2.0
#SingleInstance Force


; TOOLTIP
;------------------------------------------------------------------------------

  CoordMode "ToolTip", "Screen"

  custom_display(display_string){
    ToolTip
    ToolTip display_string, 1920, 1080  
  }

;------------------------------------------------------------------------------



; SUSPEND
;------------------------------------------------------------------------------

  Global script_state := "RUNNING" ;"RUNNING" | "SUSPENDED"
  custom_display(script_state)

  #SuspendExempt
  $PgUp::{
    Suspend
    Global script_state := script_state = "RUNNING" ? "SUSPENDED" : "RUNNING"
    custom_display(script_state)
  }
  #SuspendExempt False

;------------------------------------------------------------------------------



; RELOAD
;------------------------------------------------------------------------------

  #SuspendExempt
  $PgDn::{
    custom_display("RELOADING")
    Sleep 500
    Reload
  }
  #SuspendExempt False

;------------------------------------------------------------------------------



; LAYER CONTROL
;------------------------------------------------------------------------------
  Global current_layer := "BASE" 

  switch_layer(layer){
    Global current_layer := layer
    custom_display(current_layer)
  }
;------------------------------------------------------------------------------



; BASE LAYER (COLEMAK WIDE)
;------------------------------------------------------------------------------
  #HotIf current_layer = "BASE"
    ; TOP ROW
    q::q
    w::w
    e::f
    r::p
    t::g
    y::Return
    u::j
    i::l
    o::u
    p::y
    [::Return
    ]::Return
    \::Return

    ; HOME ROW
    a::a
    s::r
    d::s
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
    v::Return
    b::v
    n::b
    m::k
    ,::m
    .::Return
    /::Return 
  #HotIf
;------------------------------------------------------------------------------

