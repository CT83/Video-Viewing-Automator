#include <WinAPISys.au3>
#cs`
Func Pushbullet_Chk()
If $GPsh_Chk=True Then
	Push_AllInfo()
EndIf
EndFunc

#ce



Func Configure_Pushbullet()
Global $GPsh_Tk1 = "o.wyvW86MsFywIsMszyROZ2PmAL7kDafIw"
Global $GPsh_Tk2 = "o.wyvW86MsFywIsMszyROZ2PmAL7kDafIw"
Global $GPsh_Tk3 = "o.wyvW86MsFywIsMszyROZ2PmAL7kDafIw"
Global $GPsh_Tk4 = "o.wyvW86MsFywIsMszyROZ2PmAL7kDafIw"
EndFunc
Configure_Pushbullet()
Send_Pushbullet("rer","dsddadd",$GPsh_Tk1)
Send_Pushbullet("rer","dsddadd",$GPsh_Tk2)
Send_Pushbullet("rer","dsddadd",$GPsh_Tk3)
Send_Pushbullet("rer","dsddadd",$GPsh_Tk4)
#cs
Local $iPushafter
Func Push_AllInfo()
$cCounter_push=$cCounter_push+1
Local $cCounter_push = Mod ( $cCounter_push, $iPushafter )
	If $cCounter_push = 0 Then
		Local $AttemptedViews_S_D=String($AttemptedViews)
		Local $SuccessfulViews_S_D=String($SuccessfulViews)
		Local $CustomerID_S_D=String($CustomerID)
		Local $Runtime_S_D=String($RunTime)
		Local $Runtime_Cycle_Avg_D=String($Runtime_Cycle_Avg)
		Local $LastWrite_Time_S_D=String(@HOUR&":"& @MIN&" "&@MDAY &"/"& @MON &"/"& @YEAR)
		Local $Start_Time_S_D=String($FileName_Session)
		Local $sPushbullet_Data=String("Device : "&$CustomerID_S_D&@CRLF&"Views : "&$AttemptedViews_S_D&"/"&$SuccessfulViews_S_D&", , "&@CRLF&"Avg : "&$Runtime_Cycle_Avg_D)
		Send_Pushbullet($AttemptedViews_S_D&"/"&$SuccessfulViews_S_D,$sPushbullet_Data,$GPsh_Tk1)
		Send_Pushbullet($AttemptedViews_S_D&"/"&$SuccessfulViews_S_D,$sPushbullet_Data,$GPsh_Tk2)
		Send_Pushbullet($AttemptedViews_S_D&"/"&$SuccessfulViews_S_D,$sPushbullet_Data,$GPsh_Tk3)
		Send_Pushbullet($AttemptedViews_S_D&"/"&$SuccessfulViews_S_D,$sPushbullet_Data,$GPsh_Tk4)
	EndIf
EndFunc

#ce
Func Send_Pushbullet($sTitle,$sBody,$GPsh_Tk)
$sPD = '{"type": "note", "title": "'&$sTitle&'","body": "'&$sBody&'"}'
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
$oHTTP.setRequestHeader("Authorization", "Bearer " & $GPsh_Tk)
$oHTTP.SetRequestHeader("Content-Type", "application/json")
$oHTTP.Send($sPD)
EndFunc

