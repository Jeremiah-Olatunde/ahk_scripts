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
  Global current_layer := "BASE" 

  switch_layer(layer){
    Global current_layer := layer
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
    v::switch_layer("SYMBOL")
    b::v
    n::z
    m::k
    ,::h
    .::Return
    +.::Return
    /::Return 
    +/::Return

    $LAlt::{
      Send "{LAlt Up}"
      switch_layer("BASE_MOD_LEFT")
    }

    $RAlt::{
      Send "{RAlt Up}"
      switch_layer("BASE_MOD_RIGHT")
    }    
  #HotIf

;------------------------------------------------------------------------------



; LAYER BASE_MOD_RIGHT
;------------------------------------------------------------------------------

  #HotIf current_layer = "BASE_MOD_RIGHT"
    ; TOP ROW
    q::q
    w::w
    e::f
    r::p
    t::b
    y::Return
    u::Return
    i::Return
    o::Return
    p::Return
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
    j::Return
    k::RShift
    l::RCtrl
    `;::RAlt
    '::Esc

    ; BOTTOM ROW
    z::x
    x::c
    c::d
    v::Return
    b::v
    n::Return
    m::Return
    ,::Return
    .::Return
    +.::Return
    /::Return
    +/::Return
    $RAlt Up::{
      Send "{RAlt Up}"
      Send "{RCtrl Up}"
      Send "{RShift Up}"
      switch_layer("BASE")
    }
  #HotIf

;------------------------------------------------------------------------------


; LAYER BASE_MOD_lEFT
;------------------------------------------------------------------------------

  #HotIf current_layer = "BASE_MOD_LEFT"
    ; TOP ROW
    q::Return
    w::Return
    e::Return
    r::Return
    t::Return
    y::Return
    u::j
    i::l
    o::u
    p::y
    [::,
    ]::Return
    \::Return

    ; HOME ROW
    a::LWin
    s::LAlt
    d::LCtrl
    f::LShift
    g::Return
    h::Return
    j::m
    k::n
    l::e
    `;::i
    '::o

    ; BOTTOM ROW
    z::Return
    x::Return
    c::Return
    v::Return
    b::Return
    n::z
    m::k
    ,::h
    .::.
    +.::,
    /::_ 
    +/::?

    $LAlt Up::{
      Send "{LAlt Up}"
      Send "{LCtrl Up}"
      Send "{LShift Up}"
      switch_layer("BASE")
    }
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
    f::Return
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


; LAYER NUMBER
;------------------------------------------------------------------------------
  #HotIf current_layer = "WINDOW"
    j::{
      Run "komorebic focus left", , "Hide"
    }

    k::{
      Run "komorebic focus down", , "Hide"
    }

    l::{
      Run "komorebic focus up", , "Hide"
    }

    `;::{
      Run "komorebic focus right", , "Hide"
    }

    f & j::{ 
      Run "komorebic move left", ,"Hide"
    }

    f & k::{ 
      Run "komorebic move down", ,"Hide"
    }

    f & l::{ 
      Run "komorebic move up", ,"Hide"
    } 

    f & `;::{ 
      Run "komorebic move right", ,"Hide"
    }

    t::{
      Run "komorebic change-layout bsp", , "Hide"
    }

    g::{
      Run "komorebic toggle-monocle", ,"Hide"
    }
  #HotIf
;------------------------------------------------------------------------------
