#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ScreenCapture.au3>
#include <WinAPIDiag.au3>
#include <WinAPISys.au3>
#include <WinAPIFiles.au3>
#include <APIDiagConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <ScreenCapture.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiEdit.au3>
#include <Inet.au3>
#include <InetConstants.au3>
#include <Misc.au3>
#include <Date.au3>
#include <Crypt.au3>
#include <File.au3>
#include <Array.au3>
#RequireAdmin

$g_sAppFullTitle=""
Global $sSavedPath="Configurations\Default\"

;~ WriteCoords("LoginTextField",1); click the log in text field
;~ Global $LoginTextField = LocationRead("LoginTextField",1); read the log in text field on videozbpohomepage
Global $LoginTextField[2]
$LoginTextField[0]=1
$LoginTextField[1]=23
CustomClick("videoz","","","left",2,$LoginTextField[0],$LoginTextField[1]) ;clicking Login field

Func WriteCoords($j_Place,$j_Counter,$j_PlaceTxt=$j_Place)
	MsgBox("",$g_sAppFullTitle, "Click your "&$j_PlaceTxt&" "&$j_Counter&" after you click 'Ok'. " )
	Local $dll = DllOpen("user32.dll")
	While 1
		Sleep (25)
		If _IsPressed("01", $dll) Then
		$MousePos = MouseGetPos()
        ExitLoop
		EndIf
	WEnd
	DllClose($dll)
	$Coords=$MousePos
	DirCreate($sSavedPath)
	FileDelete($sSavedPath&$j_Place&$j_Counter&".ct83")
	FileWrite($sSavedPath&$j_Place&$j_Counter&".ct83",$Coords[0]&","&$Coords[1])
ConsoleWrite("Location of "& $j_Place&$j_Counter& "is "& $Coords[0]&$Coords[1])
	Return $Coords
EndFunc
Func LocationRead($j_Place,$j_Counter);This function returns array filled with mouse coordinates which were previously saved using the write_coords function
Local $LocV, $LocV1, $iCoords[3]
$j_Counter=String($j_Counter)
FileChangeDir(@ScriptDir)
If Not _FileReadToArray($sSavedPath&$j_Place&$j_Counter&".ct83", $LocV1) Then
	MsgBox($MB_SYSTEMMODAL, "", "No Saved Config Data was found please repeat 'Setup' in the settings tab. Setup will automatically start after you click 'OK'")
;~ 	Restart()
;~ 	Calibrate_Load()
EndIf
$LocV = _ArrayToString($LocV1)
MsgBox("","",$LocV)
$LocV1 = StringTrimLeft($LocV,2) ; Remove the 5 rightmost characters from the string.
$LocV1=StringSplit($LocV1,",")
$iCoords[0]=Int($LocV1[1])
$iCoords[1]=Int($LocV1[2])
ConsoleWrite("Location of "& $j_Place&$j_Counter& "is "& $iCoords[0]&$iCoords[1])
Return($iCoords);an aray which contains coords
EndFunc

Func CustomClick($sTitle,$sText,$sControlId,$sButton,$iClicks,$iX,$iY)
ConsoleWrite("C. Clicking " &"("& $iX &","& $iY &")")
	Local $OffSetX=0
	Local $OffSetY=0
	ControlClick($sTitle,$sText,$sControlId,$sButton,$iClicks,$iX+$OffSetX,$iY+$OffSetY)
	MouseMove($iX+$OffSetX,$iY+$OffSetY)
EndFunc