#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force

#NoTrayIcon
SetCapsLockState, AlwaysOff

/*
| Shortcut                         | Output                           |
| -------------------------------- | -------------------------------- |
| CAPSLOCK + { i, j, k, l }        | { Up, Left, Down, Right }        |
| CAPSLOCK + { u, o }              | { Home, End }                    |
| CAPSLOCK + { y, h }              | { PageUp, PageDown }             |
| CAPSLOCK + { Backspace }         | { Delete }                       |
*/

CapsLock & i::Up
CapsLock & k::Down
CapsLock & j::Left
CapsLock & l::Right

CapsLock & u::Home
CapsLock & o::End

CapsLock & y::PgUp
CapsLock & h::PgDn

CapsLock & Backspace::Delete

CapsLock & p::^Left ; Go one word back
CapsLock & VK0xBA::^Right ; Go one word forward

CapsLock & Enter::AppsKey ; Show context menu at the cursor

CapsLock & <::#^Left ; Switch windows desktop backwards
CapsLock & >::#^Right ; Switch windows desktop forwards

CapsLock & Esc::WinClose, A

VK0xE2::Shift ; Remap sliced shift key back to shift

:o:"""::@
:o:---::—

CapsLock::
    If (A_PriorHotKey = A_ThisHotkey and A_TimeSincePriorHotkey < 210 and GetKeyState("CapsLock", "T") = 0)
        SetCapsLockState, AlwaysOn
    else If (A_PriorHotKey = A_ThisHotkey and A_TimeSincePriorHotkey < 210 and GetKeyState("CapsLock", "T") = 1)
        SetCapsLockState, AlwaysOff ; Use double push to use capsLock.
return

CapsLock & \:: Winset, Alwaysontop, , A ; Make current window on top of others