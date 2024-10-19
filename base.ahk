; CONVENTION
; built in identifiers are CamelCased 
; user defined identifers are snake_cased

#Requires AutoHotkey v2.0
#SingleInstance Force

; TOOLTIP
;------------------------------------------------------------------------------

  CoordMode "ToolTip", "Screen"

  custom_display(display_string){
    Suspend
    ToolTip
    ToolTip display_string, 1920, 1080  
  }

;------------------------------------------------------------------------------



; SUSPEND
;------------------------------------------------------------------------------

  GLOBAL suspended := False

  #SuspendExempt
  $PgUp::{
    Suspend
    GLOBAL suspended := !suspended
    custom_display(suspended ? "SUSPENDED" : "ACTIVATED")
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
