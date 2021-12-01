#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force
#NoTrayIcon

SC033::
    if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200 && WinActive("Amazon WorkSpaces")) {
        Send ^{ z }
        Gui, help: Add, Text
        Gui, help: Show
        Send #^{Left}
        sleep, 100
        Gui, help: Destroy
    } else {
        Send { SC033 } 
    }
return

SC035::
    if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 110) {
        WinSet, Style, -0xC40000 , A
    } else {
        Send { SC035 } 
    }
return

ToggleFakeFullscreen()
{
    CoordMode Screen, Window
    static WINDOW_STYLE_UNDECORATED := -0xC40000
    static savedInfo := Object() ;; Associative array!
    WinGet, id, ID, A
    if (savedInfo[id])
    {
        inf := savedInfo[id]
        WinSet, Style, % inf["style"], ahk_id %id%
        WinMove, ahk_id %id%,, % inf["x"], % inf["y"], % inf["width"], % inf["height"]
        savedInfo[id] := ""
    }
    else
    {
        savedInfo[id] := inf := Object()
        WinGet, ltmp, Style, A
        inf["style"] := ltmp
        WinGetPos, ltmpX, ltmpY, ltmpWidth, ltmpHeight, ahk_id %id%
        inf["x"] := ltmpX
        inf["y"] := ltmpY
        inf["width"] := ltmpWidth
        inf["height"] := ltmpHeight
        WinSet, Style, %WINDOW_STYLE_UNDECORATED%, ahk_id %id%
        mon := GetMonitorActiveWindow()
        SysGet, mon, Monitor, %mon%
        WinMove, A,, %monLeft%, %monTop% - 24, % monRight-monLeft, % monBottom-monTop + 27
    }
}

GetMonitorAtPos(x,y)
{
    ;; Monitor number at position x,y or -1 if x,y outside monitors.
    SysGet monitorCount, MonitorCount
    i := 0
    while(i < monitorCount)
    {
        SysGet area, Monitor, %i%
        if ( areaLeft <= x && x <= areaRight && areaTop <= y && y <= areaBottom )
        {
            return i
        }
        i := i+1
    }
return -1
}

GetMonitorActiveWindow(){
    ;; Get Monitor number at the center position of the Active window.
    WinGetPos x,y,width,height, A
return GetMonitorAtPos(x+width/2, y+height/2)
}

WheelRight::
    if (WinActive("Amazon WorkSpaces")) {
        Gui, help: Add, Text
        Gui, help: Show
        Send #^{Left}
        sleep, 100
        Gui, help: Destroy
    } else {
        Send #^{Left}
    }
return

WheelLeft::
    Send #^{Right}
    sleep, 100
return