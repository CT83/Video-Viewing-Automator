Func Randomization_Chk()
If $GS1_RandChk=True Then
	Randomize()

	;$target is the target
	;$hustle limit is the hustle limit
	Local $iTarget=800 ;original target before randomization
	Local $iHustle_Lim=40 ; original hustle limit before randomization

	Func Randomize($iTarget_diff,$iHustle_Lim_dif)
	$Randomized_Target=Random($iTarget-$iTarget_diff,$iTarget+$iTarget_diff,1)
	$Randomized_Hustle=Random($iHustle_Lim-$iHustle_Lim_diff,$iHustle_Lim+$iHustle_Lim_diff,1)
	Return 0
Else
	Return 1 ;if rand chk is not checked
EndIf
EndFunc
