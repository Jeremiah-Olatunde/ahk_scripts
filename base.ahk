; CONVENTION
; built in identifiers are CamelCased 
; user defined identifers are snake_cased

#Requires AutoHotkey v2.0
#SingleInstance Force


; GLOBAL SCRIPT STATE
;------------------------------------------------------------------------------

GLOBAL script_state := "RUNNING" ;"RUNNING" | "SUSPENDED"

;------------------------------------------------------------------------------

; TOOLTIP
;------------------------------------------------------------------------------

  CoordMode "ToolTip", "Screen"

  custom_display(display_string){
    Suspend
    ToolTip
    ToolTip display_string, 1920, 1080  
  }

  custom_display(script_state)

;------------------------------------------------------------------------------



; SUSPEND
;------------------------------------------------------------------------------

  #SuspendExempt
  $PgUp::{
    Suspend
    GLOBAL script_state := script_state = "RUNNING" ? "SUSPENDED" : "RUNNING"
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
