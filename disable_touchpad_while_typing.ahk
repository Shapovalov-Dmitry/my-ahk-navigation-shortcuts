; Thanks to https://www.reddit.com/r/AutoHotkey/comments/74whf2/trying_to_disable_touchpad_while_typing_on_a_cube/

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

Loop 26 {
    ch = % Chr(A_Index+96)
    HotKey, ~%ch%, DisableTouchpad
}
Return

DisableTouchpad:
    blm=1
    BlockInput, MouseMove
    SetTimer, EnableTouchpad, -700 ; Negative so as to not loop (thanks u/tynansdtm)
Return

DoNothing:
Return

EnableTouchpad:
    blm=0
    BlockInput, MouseMoveOff
return

#if blm
LButton::
RButton::
MButton::
return
#if 

