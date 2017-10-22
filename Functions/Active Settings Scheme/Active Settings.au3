Func Config_ActSettings()
	Local $TS1=$GS1_TarChk
	Local $TS2=$GS2_TarChk
	Local $TS3=$GS3_TarChk
If $GChk_SRand=1 Then
	Local $iRnd=Random(1,3,0)
Switch $iRnd
	Case 1
		$GS1_TarChk=1
	Case 2
		$GS2_TarChk=1
	Case 3
		$GS3_TarChk=1
EndSwitch
EndIf

If $GS1_TarChk=1 Then
	Global $TarToday= $GS1_TarToday
	Global $TarHours=$GS1_TarHours
	Global $TarChk=$GS1_TarChk

	Global $HusLim=$GS1_HusLim
	Global $HusBef= $GS1_HusBef
	Global $HusThres=$GS1_HusThres
	Global $HusChk=$GS1_HusChk

	Global $RandTar= $GS1_RandTar
	Global $RandHus=$GS1_RandHus
	Global $RandChk=$GS1_RandChk
Else
	If $GS2_TarChk=1 Then
	Global $TarToday= $GS2_TarToday
	Global $TarHours=$GS2_TarHours
	Global $TarChk=$GS2_TarChk

	Global $HusLim=$GS2_HusLim
	Global $HusBef= $GS2_HusBef
	Global $HusThres=$GS2_HusThres
	Global $HusChk=$GS2_HusChk

	Global $RandTar= $GS2_RandTar
	Global $RandHus=$GS2_RandHus
	Global $RandChk=$GS2_RandChk

	Else
		If $GS3_TarChk=1 Then
	Global $TarToday= $GS3_TarToday
	Global $TarHours=$GS3_TarHours
	Global $TarChk=$GS3_TarChk

	Global $HusLim=$GS3_HusLim
	Global $HusBef= $GS3_HusBef
	Global $HusThres=$GS3_HusThres
	Global $HusChk=$GS3_HusChk

	Global $RandTar= $GS3_RandTar
	Global $RandHus=$GS3_RandHus
	Global $RandChk=$GS3_RandChk
		EndIf
	EndIf
EndIf

$GS1_TarChk=$TS1
$GS2_TarChk=$TS2
$GS3_TarChk=$TS3
ToolTip2("Choosing Scheme "&$iRnd)
ToolTip2("$TarToday : "&$TarToday)
ToolTip2("$TarHours : "&$TarHours)
ToolTip2("$TarChk : "&$TarChk)

ToolTip2("$HusLim 	: "&$HusLim)
ToolTip2("$HusBef 	: "&$HusBef)
ToolTip2("$HusThres : "&$HusThres)
ToolTip2("$HusChk : "&$HusChk)

ToolTip2("$RandTar	:  "&$RandTar)
ToolTip2("$RandHus	:  "&$RandHus)
ToolTip2("$RandChk	:  "&$RandChk)
Randomization_Chk($TarToday,$HusLim,$RandTar,$RandHus,$RandChk)
GUICtrlSetData($Rand_Tar,$TarToday)
GUICtrlSetData($Rand_Hus,$HusLim)
GUICtrlSetData($Rand_Setting,$iRnd)

EndFunc
	Func Randomization_Chk($TarToday,$HusLim,$RandTar,$RandHus,$RandChk)
If $RandChk=1 Then
	ToolTip2("Randomization Checked!")
	Global $TarToday=Random($TarToday-$RandTar,$TarToday+$RandTar,1)
	Global $HusLim=Random($iHustle_Lim-$RandHus,$iHustle_Lim+$RandHus,1)
	ToolTip2("Values Randomized as: ")
	ToolTip2("$TarToday : "&$TarToday)
	ToolTip2("$HusLim 	: "&$HusLim)
EndIf
EndFunc