#include <Misc.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

$1stWin = Run( "C:\Windows\Notepad.exe", "")
ProcessWait($1stWin)
Sleep(1000) ; give process time to open a window
$Data = _WinAPI_EnumProcessWindows($1stWin)
If @error Then
     MsgBox(0, 'ERROR', 'Failed to find window to PID: ' & $1stWin)
Else
$hWnd1 = $Data[1][0]
$state = WinGetState ( $hWnd1)
WinSetState($hWnd1, "", @SW_MINIMIZE)
#comments-start Sleep(1000) ; pause before moving window
//WinMove($hWnd1, "", 100, 100, 500, 600)
$res = _WinAPI_SetParent($hWnd1,_WinAPI_GetDesktopWindow())
#comments-end
EndIf
