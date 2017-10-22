Global $iViews

;enter successful views as parameters
Func Get_Earnings($iViews)
;limits
Local $iSlab_1=1201
Local $iSlab_2=801
Local $iSlab_3=401
Local $iSlab_4=101

;earnings
Local $ieSlab_1=0.75
Local $ieSlab_2=0.55
Local $ieSlab_3=0.35
Local $ieSlab_4=0.20
Local $ieSlab_min=0.10

If $iViews >= $iSlab_1 Then
	$fIncome=$iViews*$ieSlab_1
	Return $fIncome
Else
	If $iViews >= $iSlab_2 Then
		$fIncome=$iViews*$ieSlab_2
		Return $fIncome
	Else
		If $iViews >= $iSlab_3 Then
			$fIncome=$iViews*$ieSlab_3
			Return $fIncome
		Else
			If $iViews >= $iSlab_4 Then
				$fIncome=$iViews*$ieSlab_4
				Return $fIncome
			Else
				If $iViews < $iSlab_4 Then
					$fIncome=$iViews*$ieSlab_min
					Return $fIncome
				EndIf
			EndIf
		EndIf
	EndIf
EndIf
EndFunc