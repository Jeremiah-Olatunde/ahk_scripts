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
    v::switch_layer("LAYER_SELECT")
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
    r::Return
    t::Run("komorebic change-layout columns", , "Hide")
    y::Return
    u::{
      RunWait("komorebic stop", , "hide")
      RunWait("komorebic start", , "hide")
    }
    i::Run("komorebic focus-workspace 4", , "Hide")
    d & i::Run("komorebic move-to-workspace 4", , "Hide")
    o::Run("komorebic focus-workspace 0", , "Hide")
    d & o::Run("komorebic move-to-workspace 0", , "Hide")
    p::Run("komorebic focus-workspace 1", , "Hide")
    d & p::Run("komorebic move-to-workspace 1", , "Hide")
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
    d & j::Run("komorebic move left", , "Hide")
    f & j::Run("komorebic resize-axis horizontal increase", , "Hide")

    k::Run("komorebic focus down", , "Hide")
    d & k::Run("komorebic move down", , "Hide")
    f & k::Run("komorebic resize-axis vertical decrease", , "Hide")

    l::Run("komorebic focus up", , "Hide")
    d & l::Run("komorebic move up", , "Hide")
    f & l::Run("komorebic resize-axis vertical increase", , "Hide")

    `;::Run("komorebic focus right", , "Hide")
    d & `;::Run("komorebic move right", , "Hide")
    f & `;::Run("komorebic resize-axis horizontal decrease", , "Hide")

    '::switch_layer("BASE")

    Enter::switch_layer("BASE")

    ; BOTTOM ROW
    z::Return
    x::WinClose("A")
    c::Run("komorebic change-layout bsp", , "Hide")
    v::switch_layer("LAYER_SELECT")
    b::Run("komorebic flip-layout horizontal", , "Hide")
    n::Return
    m::Run("komorebic focus-workspace 2", , "Hide")
    d & m::Run("komorebic move-to-workspace 2", , "Hide")
    ,::Return
    .::Return
    /::Return 
  #HotIf
;------------------------------------------------------------------------------

; LAYER SELECT
;------------------------------------------------------------------------------
  #HotIf current_layer = "LAYER_SELECT"
    ; TOP ROW
    q::Return
    w::Run("chrome")
    e::Run("subl -n")
    r::Return
    t::Return
    y::Return
    u::Return
    i::Return
    o::Run("powershell")
    p::Run("firefox")
    [::Return
    ]::Return
    \::Return

    ; HOME ROW
    a::Return
    s::switch_layer("NAVIGATION")
    d::switch_layer("WINDOW")
    f::Return
    g::Return
    h::Return
    j::Return
    k::Return
    l::Return
    `;::Return
    '::switch_layer("BASE")

    ; BOTTOM ROW
    z::Return
    x::Return
    c::Return
    v::Return
    b::Return
    n::Return
    m::Return
    ,::Return
    .::Return
    /::Return
  #HotIf
;------------------------------------------------------------------------------


; NAVIGATION
;------------------------------------------------------------------------------
  #HotIf current_layer = "NAVIGATION"
    ; TOP ROW
    q::Return
    w::Return
    e::Return
    r::Return
    t::Return
    y::Return
    u::Return
    i::Return
    o::Home
    p::End
    [::Return
    ]::Return
    \::Return

    ; HOME ROW
    a::Return
    s::Return
    d::LCtrl
    f::LShift
    g::Return
    h::Return
    j::Left
    k::Down
    l::Up
    `;::Right
    '::switch_layer("BASE")

    ; BOTTOM ROW
    z::Return
    x::Return
    c::Return
    v::switch_layer("LAYER_SELECT")
    b::Return
    n::Return
    m::Return
    ,::Return
    .::Return
    /::Return
  #HotIf
;------------------------------------------------------------------------------