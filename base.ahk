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

  custom_display(script_state)

;------------------------------------------------------------------------------



; SUSPEND
;------------------------------------------------------------------------------

  Global script_state := "RUNNING" ;"RUNNING" | "SUSPENDED"

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



; MODIFIERS
;------------------------------------------------------------------------------

  Tab::Tab
  CapsLock::LCtrl
  LShift::LShift

  Enter::Enter
  RShift::RCtrl
  /::RShift

;------------------------------------------------------------------------------



; LAYER CONTROL
;------------------------------------------------------------------------------

  Global current_layer := "BASE" ;"BASE" | "SYMBOL"

  switch_layer_symbol(){
    Global current_layer := "SYMBOL"
    custom_display(current_layer)
  }

;------------------------------------------------------------------------------




; LAYER BASE
;------------------------------------------------------------------------------

  #HotIf current_layer = "BASE"
    ; TOP ROW
    q::q
    w::w
    e::f
    r::p
    t::b
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
    g::g
    h::Return
    j::m
    k::n
    l::e
    `;::i
    '::o

    ; BOTTOM ROW
    z::x
    x::c
    c::d
    v::switch_layer_symbol
    b::v
    n::z
    m::k
    ,::h
    .::Return
    ; $/::Return ; ASSIGNED TO RIGHT SHIFT
  #HotIf

;------------------------------------------------------------------------------
