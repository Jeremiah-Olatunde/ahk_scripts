#Requires AutoHotkey v2.0

; CurrentLayer

; $LShift::{
;   v := KeyWait("LShift", "T0.1")
;   if(v = 0){
;     MsgBox "held shift"
;   }

;   if(v = 1){
;     MsgBox "tapped shift"
;   }
; }

; LShift::LControl

CapsLock::LControl
; RShift::RControl

; $Enter::{

; }

; $^Enter::{
;   v := KeyWait("Enter", "T0.1")

;   if(v = 0){
;     ; MsgBox "enter held"
;     Send "^{RShift down}"
;     KeyWait "Enter"
;     Send "{RShift up}"
;   }

;   if(v = 1){
;     ; MsgBox "enter tapped"
;     Send "{Enter}"
;   }
; }

; *$Enter::{
;   v := KeyWait("Enter", "T0.1")
;   ; MsgBox A_PriorKey

;   if(v = 0){
;     ; MsgBox "enter held"
;     Send "{RShift down}"
;     KeyWait "Enter"
;     Send "{RShift up}"
;   }

;   if(v = 1){
;     ; MsgBox "enter tapped"
;     ; MsgBox A_PriorKey
;     if(A_PriorKey == "Enter"){
;       Send "{Enter}"
;       Return
;     }
;     ; MsgBox("Shift + " . A_PriorKey)
;     Send "{Backspace}+" . A_PriorKey
;   }
; }

; RShift & LShift::MsgBox "Domain Expansion: Malevolent Shrine"
; RShift & LShift::MsgBox "Domain Expansion"


; *$Enter::{
;   v := KeyWait("Enter", "T0.1")
;   ; MsgBox A_PriorKey

;   if(v = 0){
;     ; MsgBox "enter held"
;     Send "{RControl down}"
;     KeyWait "Enter"
;     Send "{RControl up}"
;   }

;   if(v = 1){
;     ; MsgBox "enter tapped"
;     ; MsgBox A_PriorKey
;     if(A_PriorKey == "Enter"){
;       Send "{Enter}"
;       Return
;     }
;     ; MsgBox("Control + " . A_PriorKey)
;   }
; }


; home row remapping
; '::l
; `;::k
; l::j
; k::h

; j::;
; h::'

; ; top row

; ]::p
; [::o
; p::i
; o::u
; i::y

; u::[
; y::]


; ; bottom row 

; /::m
; .::n
; ,::b

; m::.
; n::/
; b::,



; q::q
; w::w
; e::f
; r::p
; t::g
; y::j
; u::l
; i::u
; o::y
; p:::
; [::[
; ]::]

q::q
w::w
e::f
r::p
t::g
y::`;
u::]
i::[
o::j
p::l
[::u
]::y

