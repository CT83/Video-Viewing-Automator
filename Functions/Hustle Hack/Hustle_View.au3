;Magic
Global $1Hour=3600
Global $1Hour_Mins=60
Global $SlpMng_TElp=3600*1.5
Global $Misc_Time=44

Global $iFirstR_SlpMng=0
Global $SleepWait=0
Global $Target=799, $Hours=23;Elapsed time in an hour, returned by TimeElap_Hour Func.
Global $Target_Hour=$Target/$Hours


Global $Hours_Els=0




Global $iViews_ThisHour=0
Global $aT_Views[1000][1000]
Global $iHours_LastC=0

Global $SlpMng_TElpHour=TimeElap_Hour($SlpMng_TElp)

ViewsThisHr("add")
$Views_ThisHr1=ViewsThisHr("return")
MsgBox("","","Time Elasped in an Hour : "&$SlpMng_TElpHour& @CRLF & "Target for this Hour : "&$Target_Hour &@CRLF& "Views this Hour : "&$Views_ThisHr1&@CRLF& "Misc. Time spent : "&$Views_ThisHr1)
$iFirstR_SlpMng=1;remove this
Global $test = SleepManage($SlpMng_TElpHour,$Views_ThisHr1, $Target_Hour,$Misc_Time)
MsgBox("","","Time needed to watch for this hustle : " & $test)




Func SleepManage($SlpMng_TElpHour,$Views_ThisHr1, $Target_Hour,$Misc_Time)
	If $iFirstR_SlpMng=0 Then
	$SleepWait=($1Hour-$Misc_Time/$Target_Hour)
	Return $SleepWait
	EndIf
	$iFirstR_SlpMng=1
	$SleepWait=(($1Hour-$SlpMng_TElpHour)/($Target_Hour-$Views_ThisHr1))
	MsgBox("","",$1Hour&"-"&$SlpMng_TElpHour& " / " & $Target_Hour & "-" & $Views_ThisHr1)
	$SleepWait=$SleepWait*60
	MsgBox("","",$SleepWait &"-"&$Misc_Time)
	$SleepWait=$SleepWait-$Misc_Time
	$SleepWait=Sec2Time($SleepWait)
	Return $SleepWait
EndFunc
	Func TimeElap_Hour($SlpMng_TElp)
Local $TimeElap_Hour
If($SlpMng_TElp>$1Hour) Then
	While ($SlpMng_TElp>$1Hour)
		$SlpMng_TElp=$SlpMng_TElp-$1Hour
		$Hours_Els=$Hours_Els+1
	WEnd
;~ 	MsgBox("","","Hours Elasped are : "&$Hours_Els) ;remove this, this is the number of hours elapsed
	Return $SlpMng_TElp
Else
	Return $SlpMng_TElp
EndIf
EndFunc
	;this will be run when successful and attemp
		Func ViewsThisHr($iChoice) ;timeelap hour func needs to be called before this for var $Hours_Els
Switch $iChoice
	Case "add"
		If $Hours_Els = $iHours_LastC Then
			$iViews_ThisHour=$iViews_ThisHour+1
			$aT_Views[$Hours_Els][$iViews_ThisHour]=1
		Else
			$iHours_LastC=$Hours_Els
			$iViews_ThisHour=1
			Return $iViews_ThisHour
		EndIf
	$iHours_LastC=$Hours_Els
	Case "return"
		Return $iViews_ThisHour
EndSwitch
EndFunc




Global $fMisc_Tim[5000],$fMisc_TDiff[5000],$aMisc_Time[5000]
;at start of each brain
CMisc_Time("start",$iAttemptedV)
;do brain stuff
CMisc_Time("stop",$iAttemptedV)
;calculate
$aMisc_Time[$iAttemptedV]=CMisc_Time("return",$iAttemptedV)
Func CMisc_Time($sChoice,$iAttemptedV)
Switch $sChoice
	Case "start"
		$fMisc_Tim[$iAttemptedV] = TimerInit()
	Case "stop"
		$fMisc_TDiff[$iAttemptedV]= TimerDiff($fMisc_Tim[$iAttemptedV])
	Case "return"
		Return $fMisc_TDiff[$iAttemptedV]
	Case "stop,return"
		$fMisc_TDiff = TimerDiff($fMisc_Tim[$iAttemptedV])
		Return $fMisc_TDiff[$iAttemptedV]
	Case "return avg"
		For Local $iAttemptC=1 To $AttemptedViews Step +1
			$iT_MiscTime1=$fMisc_TDiff[$iAttemptC]
			$iT_MiscTime=$iT_MiscTime+$iT_MiscTime1
		Next
			Return $iT_MiscTime/$iAttemptC
EndSwitch
EndFunc


Global $Hustle_Thres=45 ;mins take from gui
Func Hustle_Thres($iHustle_Thres)
Local $iHus_ThresTim
Switch $Hustle_Thres
	Case "start"
		$iHus_ThresTim=TimerInit()
	Case "stop"
		$iHus_ThresDiff= TimerDiff($iHus_ThresTim)
		$iHus_ThresDiff=$iHus_ThresDiff/60
	case "return"
		Return $iHus_ThresDiff
	case "process"
		If $iHus_ThresDiff>= $iHustle_Thres Then
			;Hustle threshold reached
			StartHustle()
		EndIf
	case "auto"
		$iHus_ThresDiff= TimerDiff($iHus_ThresTim)
		If $iHus_ThresDiff>= $iHustle_Thres Then
			$iHus_ThresDiff=0
			;Hustle threshold reached
			StartHustle()
		EndIf
Endfunc



Func CheckNeedToHustle($iViews_ThisHour,$iTarget_perHour,$iTime_ElspHr_Mins)
ToolTip2("Checking Hustle is Necessary...")
Local $bIsHusNece
ToolTip2("("&$1Hour_Mins&"-"&$iTime_ElspHr_Mins&")/("&$iTarget_perHour&"-"&$iViews_ThisHour&")"&  "("&$1Hour_Mins&")/("&$iTarget_perHour&")")
If ($1Hour_Mins-$iTime_ElspHr_Mins)/($iTarget_perHour-$iViews_ThisHour) >= ($1Hour_Mins)/($iTarget_perHour) Then
	$bIsHusNece=False
;~ 	GUICtrlSetData($Tar_AchPos,"Yes!")
	ToolTip2("Hustle Not necessary!")
Else
;~ 	GUICtrlSetData($Tar_AchPos,"No!")
	ToolTip2("Hustle Necessary!")
	$bIsHusNece=True
EndIf
Return $bIsHusNece
Endfunc


;dont need
Func Sec2Time($nr_sec)
				$nr_sec=$nr_sec
				$sec2time_hour = Int($nr_sec / 3600)
				$sec2time_min = Int(($nr_sec - $sec2time_hour * 3600) / 60)
				$sec2time_sec = $nr_sec - $sec2time_hour * 3600 - $sec2time_min * 60
				Return StringFormat('%02d:%02d:%02d', $sec2time_hour, $sec2time_min, $sec2time_sec)
				EndFunc   ;==>Sec2Time
