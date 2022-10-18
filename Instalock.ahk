#NoEnv
#NoTrayIcon
SendMode Input
#SingleInstance Force
#MaxThreadsPerHotkey 2
#IfWinActive VALORANT
SetWorkingDir, %A_ScriptDir%


;----  SOUNDS
;
FileInstall, enable.wav, enable.wav
FileInstall, disable.wav, disable.wav


;----  DEFAULT FILES
;
defaultlist = Astra:0`nBreach:0`nBrimstone:0`nChamber:0`nCypher:0`nFade:0`nHarbor:0`nJett:0`nKayo:0`nKilljoy:0`nNeon:0`nOmen:0`nPhoenix:0`nRaze:0`nReyna:0`nSage:0`nSkye:0`nSova:0`nViper:0`nYoru:0
defaultlisty = Astra:0`nBreach:0`nBrimstone:0`nChamber:0`nCypher:0`nFade:0`nHarbor:0`nJett:0`nKayo:0`nKilljoy:0`nNeon:0`nOmen:0`nPhoenix:0`nRaze:0`nReyna:0`nSage:0`nSkye:0`nSova:0`nViper:0`nYoru:0
ifnotexist,[X]Agent List.txt
    {
    FileAppend, %defaultlist%, %A_ScriptDir%\[X]Agent List.txt
    }

ifnotexist,[Y]Agent List.txt
    {
    FileAppend, %defaultlisty%, %A_ScriptDir%\[Y]Agent List.txt
    }
	
ifnotexist,Lock Button.ini
    {
    IniWrite, 0, Lock Button.ini, Lock Button, xPosition
    IniWrite, 0, Lock Button.ini, Lock Button, yPosition
    }


;----  READ POS
;
agents:=Object()
yagents:=Object()
names:=Object()

Loop, Read, [X]Agent List.txt
{
    StringSplit, line, A_LoopReadLine, :, %A_Space%%A_Tab%
    agents[line1] := line2
}

Loop, Read, [Y]Agent List.txt
{
    StringSplit, linee, A_LoopReadLine, :, %A_Space%%A_Tab%
    yagents[linee1] := linee2
}

for i, element in agents
    names .= i . "|"

IniRead, xLock, Lock Button.ini, Lock Button, xPosition
IniRead, yLock, Lock Button.ini, Lock Button, yPosition


;----  GUI
;
Gui, -MinimizeBox
Gui, Font, s10
Gui, Color, FFFFFF, FFFFFF
Gui, Add, DropDownList,w70 vElement gAction, %names%
Gui, Add, Link,,F4 - On / Off`nF9 - Exit
Gui, Show, w95 h75, Agent Picker


;----  LAST WINDOW POS
;
ifnotexist,ignore.ini
    {
    IniWrite, first, ignore.ini, lastwinpos, xpos
    IniWrite, first, ignore.ini, lastwinpos, ypos
    }

IniRead, xpos, ignore.ini, lastwinpos, xpos
IniRead, ypos, ignore.ini, lastwinpos, ypos
if xpos is number
  Gui, show, w95 h75 x%xpos% y%ypos%,` `
return

GuiClose:
  WinGetPos, xpos, ypos
  IniWrite, %xpos%, ignore.ini, lastwinpos, xpos
  IniWrite, %ypos%, ignore.ini, lastwinpos, ypos
  ExitApp


;----  GUI AGENT SELECTION
;
x =
y =
name =

Action:
Gui, Submit, nohide
x = % agents[Element]
y = % yagents[Element]
name = % Element
return


;----  TOGGLE SCRIPT
;
toggle=false
F4::
toggle := !toggle
if !toggle
	{
        SoundPlay, disable.wav
        return
    }

SoundPlay, enable.wav
Loop
{    
    if !toggle
        break 
    
        Random, var, 25, 80
        Random, var2, 20, 140
        Sleep %var2%
		DllCall("SetCursorPos", "int", x, "int", y)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x02)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x04)
		Sleep %var2%
        DllCall("SetCursorPos", "int", xLock, "int", yLock)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x02)
		Sleep %var%
		DllCall("mouse_event", "UInt", 0x04)
}
return

#IfWinActive

F9::ExitApp


ScriptGuard1()
{
  static _ := ScriptGuard1()
  local ahk:=">AUTOHOTKEY SCRIPT<", pt:=rc:=sz:=0
  if A_IsCompiled
  { if (rc:=DllCall("FindResource",  "Ptr",0, "Str",ahk, "Ptr",10, "Ptr"))
    && (sz:=DllCall("SizeofResource","Ptr",0, "Ptr",rc,  "Uint"))
    && (pt:=DllCall("LoadResource",  "Ptr",0, "Ptr",rc,  "Ptr"))
    && (pt:=DllCall("LockResource",  "Ptr",pt,"Ptr"))
    && (DllCall("VirtualProtect", "Ptr",pt, "Ptr",sz, "UInt",0x40, "UInt*",rc))
      DllCall("RtlZeroMemory", "UInt",pt, "Int",sz)
    else MsgBox 64,,% "Warning: ScriptGuard1 not active!`n`nError = "
      . (A_LastError=1814 ? ("Resource Name '" ahk "' not found.`nTo fix, see "
      . "the 'Example 1' comments at http://bit.ly/BinMod.") : A_LastError)
} }