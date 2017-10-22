#include <WinAPISys.au3>
Func Configure_Pushbullet()
Global $vAccessToken = "o.wyvW86MsFywIsMszyROZ2PmAL7kDafIw"
EndFunc

Send_Pushbullet("I like cars","I like cars")
Func Send_Pushbullet($sTitle,$sBody)
$sPD = '{"type": "note", "title": "'&$sTitle&'","body": "'&$sBody&'"}'
$oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
$oHTTP.Open("POST", "https://api.pushbullet.com/v2/pushes", False)
$oHTTP.setRequestHeader("Authorization", "Bearer " & $vAccessToken)
$oHTTP.SetRequestHeader("Content-Type", "application/json")
$oHTTP.Send($sPD)
EndFunc

