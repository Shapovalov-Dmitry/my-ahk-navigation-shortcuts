#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force

SetCapsLockState, AlwaysOff

SC03a & Tab::PrintScreen

SC03a & F1::SetCapsLockState, AlwaysOff
SC03a & F2::SetCapsLockState, AlwaysOn

SC03a & i::Up
SC03a & k::Down
SC03a & j::Left
SC03a & l::Right

SC03a & u::Home
SC03a & o::End

SC03a & y::PgUp
SC03a & h::PgDn

SC03a & SC033:: #^Left

SC03a & SC034:: #^Right

SC03a & Backspace::Delete

SC03a & Enter::AppsKey ; Show context menu at the cursor

:*:long- ::{U+2014}