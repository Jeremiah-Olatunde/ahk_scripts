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
  Global current_layer := "WINDOW" 

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
    CapsLock::switch_layer("WINDOW")
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
    LShift::switch_layer("WINDOW")
    z::x
    x::c
    c::d
    v::Return
    b::v
    n::z
    m::k
    ,::h
    .::Return
    /::Return 
  #HotIf
;------------------------------------------------------------------------------



; WINDOW
;------------------------------------------------------------------------------
  #HotIf current_layer = "WINDOW"
    ; TOP ROW
    q::Return
    w::Return
    e::Return
    r::{
      RunWait("komorebic stop", , "hide")
      RunWait("komorebic start", , "hide")
    }
    t::Run("komorebic change-layout columns", , "Hide")
    y::Return
    u::Return
    i::Return
    o::Run("komorebic focus-workspace 0", , "Hide")
    f & o::Run("komorebic move-to-workspace 0", , "Hide")
    p::Run("komorebic focus-workspace 1", , "Hide")
    f & p::Run("komorebic move-to-workspace 1", , "Hide")
    [::Return
    ]::Return
    \::Return 
    

    ; HOME ROW
    a::Return
    s::Return
    d::Return
    f::Run("komorebic toggle-monocle", , "Hide")
    g::Return
    h::Return

    j::Run("komorebic focus left", , "Hide")
    f & j::Run("komorebic move left", , "Hide")
    d & j::Run("komorebic resize-axis horizontal increase", , "Hide")

    k::Run("komorebic focus down", , "Hide")
    f & k::Run("komorebic move down", , "Hide")
    d & k::Run("komorebic resize-axis vertical decrease", , "Hide")

    l::Run("komorebic focus up", , "Hide")
    f & l::Run("komorebic move up", , "Hide")
    d & l::Run("komorebic resize-axis vertical increase", , "Hide")

    `;::Run("komorebic focus right", , "Hide")
    f & `;::Run("komorebic move right", , "Hide")
    d & `;::Run("komorebic resize-axis horizontal decrease", , "Hide")

    '::switch_layer("BASE")

    Enter::switch_layer("BASE")

    ; BOTTOM ROW
    z::Return
    x::Return
    c::Run("komorebic change-layout bsp", , "Hide")
    v::Run("komorebic flip-layout horizontal", , "Hide")
    b::Return
    n::Return
    m::Run("komorebic focus-workspace 2", , "Hide")
    f & m::Run("komorebic move-to-workspace 2", , "Hide")
    ,::Return
    .::Return
    /::Return 
  #HotIf
;------------------------------------------------------------------------------

