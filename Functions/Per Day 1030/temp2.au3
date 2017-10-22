#include <Date.au3>
#include <MsgBoxConstants.au3>

$CurrentTime=String(_StringStripChars(_NowTime(3), ':'))
$CurrentTime=Number($CurrentTime)
MsgBox($MB_SYSTEMMODAL, '', "The time is:" &$CurrentTime )
If $CurrentTime>103000 Then
	MsgBox("","","Current time is greater than 10:30")
Else
	MsgBox("","","Curremt time is not greater than 10:30")
EndIf


Func _StringStripChars($sString, $sChars)
    If $sChars == '' Then Return SetError(1, 0, $sString)
    If $sString == '' Then Return SetError(2, 0, $sString)
    $sChars = StringRegExpReplace($sChars, '\\([eEqQ])', '\1\\')
    Return StringRegExpReplace($sString, '[\Q' & $sChars & '\E]', '')
EndFunc   ;==>_StringStripChars