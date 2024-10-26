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


; COLEMAK DH WIDE MOD (MINOR TWEAKS)
;------------------------------------------------------------------------------

    +9::[
    +0::]

    ; TOP ROW
    q::q
    w::w
    e::f
    r::p
    t::b
    y::} ; default [ {
    +y::)
    u::j
    i::l
    o::u
    p::y
    [::;
    ]::/ ; default ' "
    \::\

    ; HOME ROW
    a::a
    s::r
    d::s
    f::t
    g::g
    h::`{ ; default ] }
    +h::(
    j::m
    k::n
    l::e
    `;::i
    '::o

    ; BOTTOM ROW
    z::x
    x::c
    c::d
    v::' ; default v
    b::v ; default z
    n::z ; default / ?
    m::k
    ,::h
    .::, 
    /::.

;------------------------------------------------------------------------------
