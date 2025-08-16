; Fixology - Grammar Correction Tool
; Press Alt+P to fix the grammar of selected text

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
#SingleInstance Force  ; Only allow one instance of this script to run
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetBatchLines -1  ; Make the script run as fast as possible

; Set tooltip messages
TooltipText := "Grammar correction tool is active. Press Alt+P to fix selected text."
FixingText := "Fixing grammar..."

; Show a tray tip on startup
TrayTip, Fixology, %TooltipText%, 3, 1

!p::   ; Alt + P hotkey
    ; Copy selected text
    Send, ^c
    Sleep, 200
    
    ; Show processing notification
    ToolTip, %FixingText%
    
    ; Run the Fixology grammar correction with the "process" argument to skip installation
    SetWorkingDir, %A_ScriptDir%\dist
    RunWait, Fixology.exe process
    
    ; Paste the corrected text
    Send, ^v
    
    ; Clear the tooltip
    Sleep, 200
    ToolTip
return