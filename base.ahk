; CONVENTION
; built in identifiers are CamelCased 
; user defined identifers are snake_cased

#Requires AutoHotkey v2.0
#SingleInstance Force


; GLOBAL SCRIPT VARIABLES
;------------------------------------------------------------------------------

Global script_state := "RUNNING" ;"RUNNING" | "SUSPENDED"
Global current_layer := "BASE" ;"BASE" | "SYMBOL"

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
