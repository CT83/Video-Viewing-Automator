#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Global $iFirst_Run=0
Global $iS_Time=0, $iS_TimeDisp=0

;test
Calc_Runtime(0)
Sleep(5000)
$test=Calc_Runtime(0)
MsgBox("","",$test)
$test=Calc_Runtime(1)
MsgBox("","",$test)

Func Calc_Runtime($choice)
	If $iFirst_Run=0 Then
	$iS_TimeDisp = _NowTime(5)
	$iS_Time = Number(_StringStripChars($iS_TimeDisp, ':'))
	$iFirst_Run=1
	EndIf
Local $iTime_Now=Number(_StringStripChars(_NowTime(5), ':'))
Local $iR_Time= $iTime_Now - $iS_Time

Switch $choice
;1 is for returning in Integer;  0 is for proper display time
	Case 0
		Return $iR_Time
	Case 1
		Return Sec2Time($iR_Time)
EndSwitch
EndFunc

 ;already added
Func _StringStripChars($sString, $sChars)
    If $sChars == '' Then Return SetError(1, 0, $sString)
    If $sString == '' Then Return SetError(2, 0, $sString)
    $sChars = StringRegExpReplace($sChars, '\\([eEqQ])', '\1\\')
    Return StringRegExpReplace($sString, '[\Q' & $sChars & '\E]', '')
EndFunc

Func Sec2Time($nr_sec)
$nr_sec=$nr_sec
$sec2time_hour = Int($nr_sec / 3600)
$sec2time_min = Int(($nr_sec - $sec2time_hour * 3600) / 60)
$sec2time_sec = $nr_sec - $sec2time_hour * 3600 - $sec2time_min * 60
Return StringFormat('%02d:%02d:%02d', $sec2time_hour, $sec2time_min, $sec2time_sec)
EndFunc   ;==>Sec2Time
