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



; MODIFIERS
;------------------------------------------------------------------------------
  ; #SuspendExempt
  ; Tab::Tab
  ; CapsLock::LCtrl
  ; LShift::LShift

  ; Enter::Enter
  ; RShift::RCtrl
  ; /::RShift
  ; #SuspendExempt False
;------------------------------------------------------------------------------



; LAYER CONTROL
;------------------------------------------------------------------------------

  Global current_layer := "BASE" ;"BASE" | "SYMBOL"

  switch_layer(layer){
    Global current_layer := layer
    custom_display(current_layer)
  }

  one_shot(key, layer){
    Send "{Raw}" . key
    switch_layer(layer)
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
    [::,
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
    v::switch_layer("SYMBOL")
    b::v
    n::z
    m::k
    ,::h
    .::.
    +.::,
    /::_ 
    +/::?
  #HotIf

;------------------------------------------------------------------------------


; LAYER SYMBOL
;------------------------------------------------------------------------------
  #HotIf current_layer = "SYMBOL"
    ; TOP ROW
    q::Return
    w::`
    e::#
    r::!
    t::Return
    y::Return
    u::%
    i::/
    o::[
    p::<
    [::Return
    ]::Return
    \::Return

    ; HOME ROW
    a::&
    s::|
    d::>
    f::{
      Send "{Escape}"
      switch_layer("BASE")
    }
    g::Return
    h::Return
    j::=
    k::"
    l::(
    `;::`{
    '::-
    Enter::{
      Send "{Enter}"
      switch_layer("BASE")
    }

    ; BOTTOM ROW
    z::Return
    x::Return
    c::$
    v::switch_layer("BASE")
    b::Return
    n::+
    m::;
    ,:::
    .::)
    $/::}

    Space::{
      Send "{Space}"
      switch_layer("BASE")
    }
  #HotIf  

;------------------------------------------------------------------------------
