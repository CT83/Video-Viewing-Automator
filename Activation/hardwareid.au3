;~ #RequireAdmin
#include <APIDiagConstants.au3>
#include <WinAPIDiag.au3>
FileDelete("hdid.txt")
$hardware_Current = _WinAPI_UniqueHardwareID($UHID_All)
FileWrite("hdid.txt",$hardware_Current)